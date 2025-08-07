import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:consult_me/features/call/presentation/cubit/call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/my_call_model.dart';

const String appId = "c74d620ba147479ea30543c30b9dc1c6";

/// A page for handling audio calls using Agora RTC Engine.
class AudioCall extends StatefulWidget {
  final MyCallModel call;

  const AudioCall({super.key, required this.call});

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  int? _remoteUid;
  bool _localUserJoined = false;
  bool _isMicMuted = false;
  late RtcEngine _engine;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;
  bool _callEnded = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.call.durationInMinutes! * 60;
    _initAgora();
    _startCountdownTimer();
  }

  /// Initializes Agora RTC Engine for audio call.
  Future<void> _initAgora() async {
    // Request microphone permission
    await [Permission.microphone].request();

    // Initialize Agora engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    // Register event handlers
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
          if (mounted) {
            setState(() {
              _localUserJoined = true;
              _callEnded = false;
            });
          }
        },
        onUserJoined: (connection, remoteUid, elapsed) {
          debugPrint("Remote user $remoteUid joined");
          if (mounted) {
            setState(() {
              _remoteUid = remoteUid;
              _callEnded = false;
            });
          }
        },
        onUserOffline: (connection, remoteUid, reason) {
          debugPrint("Remote user $remoteUid left channel");
          if (mounted) {
            setState(() {
              _remoteUid = null;
              _callEnded = true;
            });
          }
        },
        onTokenPrivilegeWillExpire: (connection, token) {
          debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    // Configure for audio call
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableAudio();
    await _engine.disableVideo(); // Explicitly disable video
    await _engine.joinChannel(
      token: widget.call.agoraToken!,
      channelId: widget.call.channelName!,
      uid: 37,
      options: const ChannelMediaOptions(),
    );
  }

  /// Starts the countdown timer based on call duration.
  void _startCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        _endCall();
        timer.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Call duration ended!')),
        );
      }
    });
  }

  /// Formats the remaining seconds into MM:SS format.
  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  /// Toggles the microphone mute state.
  Future<void> _toggleMic() async {
    _isMicMuted = !_isMicMuted;
    await _engine.muteLocalAudioStream(_isMicMuted);
    if (mounted) {
      setState(() {});
    }
  }

  /// Ends the call and cleans up resources.
  Future<void> _endCall() async {
    if (!_callEnded) {
      _callEnded = true;
      _localUserJoined = false;
      _remoteUid = null;
      _remainingSeconds = 0;
      _countdownTimer?.cancel();
      GetIt.instance<CallCubit>().endCall(id: widget.call.id!);
      await _engine.leaveChannel();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _engine.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          // Background with call status
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Call status indicator
                Icon(
                  _callEnded
                      ? Icons.call_end
                      : _remoteUid != null
                      ? Icons.call
                      : Icons.hourglass_empty,
                  color: Colors.white,
                  size: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  _callEnded
                      ? 'انتهت المكالمة'
                      : _remoteUid != null
                      ? 'متصل'
                      : 'جاري الاتصال...',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Timer display
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer, color: Colors.white, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        _formatDuration(_remainingSeconds),
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom controls
          if (!_callEnded)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mute/Unmute button
                  _ControlButton(
                    icon: _isMicMuted ? Icons.mic_off : Icons.mic,
                    color: _isMicMuted ? Colors.red : Colors.white,
                    backgroundColor: _isMicMuted ? Colors.red.withOpacity(0.3) : Colors.black54,
                    onPressed: _toggleMic,
                  ),
                  const SizedBox(width: 20),
                  // End call button
                  _ControlButton(
                    icon: Icons.call_end,
                    color: Colors.white,
                    backgroundColor: Colors.red,
                    onPressed: _endCall,
                    size: 60,
                  ),
                ],
              ),
            ),
          // Exit button when call ended
          if (_callEnded)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: _ControlButton(
                  icon: Icons.close,
                  color: Colors.white,
                  backgroundColor: Colors.grey,
                  onPressed: () => Navigator.pop(context),
                  size: 60,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A reusable control button for call actions.
class _ControlButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.onPressed,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: size * 0.5),
      ),
    );
  }
}