import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:consult_me/features/call/presentation/cubit/call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/models/my_call_model.dart';

const appId = "c74d620ba147479ea30543c30b9dc1c6";

class Video extends StatefulWidget {
  final MyCallModel call;

  const Video({super.key, required this.call});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  Timer? _countdownTimer;
  int? _remainingSeconds ; // 3 minutes
  bool _callEnded = false;

  @override
  void initState() {
    super.initState();
    initAgora();
    _startCountdownTimer();

  }

  Future<void> initAgora() async {
    // Retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    // Create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
            _callEnded = false; // Reset call ended state

          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
            _callEnded = false; // Reset call ended state

          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
            _callEnded = true;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: widget.call.agoraToken!,
      channelId: widget.call.channelName!,
      uid:37,
      options: const ChannelMediaOptions(),
    );
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel(); // Cancel any existing timer
    _remainingSeconds = widget.call.durationInMinutes!*60; // Reset to 3 minutes
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_remainingSeconds! > 0 &&_remainingSeconds !=null) {
          _remainingSeconds = _remainingSeconds! - 1;
        } else {
          _endCall();
          timer.cancel(); // Stop timer when it reaches 0
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Countdown timer ended!')),
          );
          // Optional: Navigate away or reset UI
          // Navigator.pushReplacementNamed(context, '/home');
        }
      });
    });
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void _endCall() async {
    if (!_callEnded) {
      setState(() {
        GetIt.instance<CallCubit>().endCall(id:widget.call.id!);
        _callEnded = true;
        _localUserJoined = false;
        _remoteUid = null;
        _remainingSeconds = 0;
        _countdownTimer?.cancel(); // Cancel timer to prevent memory leaks

      });
      await _engine.leaveChannel();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel(); // Cancel timer to prevent memory leaks
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    await _engine.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          // 📹 Remote video as fullscreen background
          Positioned.fill(
            child: _remoteVideo(),
          ),

          // 🕒 Top overlay with timer
          if (!_callEnded)
            Positioned(
              top: 40,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.timer, color: Colors.white, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      _formatDuration(_remainingSeconds ?? 0),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

          // 📷 Local user's video preview (top-right corner)
          if (!_callEnded)
            Positioned(
              top: 40,
              right: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: _localUserJoined
                      ? AgoraVideoView(
                    controller: VideoViewController(
                      rtcEngine: _engine,
                      canvas: const VideoCanvas(uid: 0),
                    ),
                  )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),

          // 📞 Bottom call control button
          if (!_callEnded)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _endCall,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.call_end, color: Colors.white, size: 28),
                  ),
                ),
              ),
            ),

          // 🛑 Call ended message
          if (_callEnded)
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/4,),

                    const Text(
                      'انتهت المكالمة',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    if (_callEnded)
                   SizedBox(height: MediaQuery.of(context).size.height/3,),
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(18),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.close, color: Colors.white, size: 28),
                            ),
                          ),
                        ),
                      ),

                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null && !_callEnded) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection:  RtcConnection(channelId: widget.call.channelName),
        ),
      );
    }
    else {
      return
    Center(child:     Text(
      style: TextStyle(color: Colors.white),
      _callEnded ? '' : 'Please wait for remote user to join',
      textAlign: TextAlign.center,
    ));
    }

  }
}