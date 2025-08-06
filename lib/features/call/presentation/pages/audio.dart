import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:consult_me/features/call/data/models/call_model.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "c74d620ba147479ea30543c30b9dc1c6";

class AudioCall extends StatefulWidget {
  final CallModel call;

  const AudioCall({super.key, required this.call});

  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> with TickerProviderStateMixin {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  Timer? _countdownTimer;
  late int _remainingSeconds;
  bool _callEnded = false;
  bool _isAudioEnabled = true;
  bool _isSpeakerEnabled = false;
  bool _controlsVisible = true;
  Timer? _controlsTimer;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    initAgora();
    _startCountdownTimer();
    _startControlsTimer();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _pulseController.repeat(reverse: true);
  }

  Future<void> initAgora() async {
    // Set initial duration
    setState(() {
      _remainingSeconds = widget.call.durationInMinutes * 60;
    });

    // Request microphone permission only
    await [Permission.microphone].request();

    // Create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
            _callEnded = false;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
            _callEnded = false;
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

    // Audio-only setup
    await _engine.disableVideo();
    await _engine.enableAudio();
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    await _engine.joinChannel(
      token: widget.call.agoraToken,
      channelId: widget.call.channelName,
      uid: 17,
      options: const ChannelMediaOptions(),
    );
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel();
    _remainingSeconds = widget.call.durationInMinutes * 60;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _endCall();
          timer.cancel();
        }
      });
    });
  }

  void _startControlsTimer() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  void _showControls() {
    setState(() {
      _controlsVisible = true;
    });
    _startControlsTimer();
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void _toggleAudio() async {
    setState(() {
      _isAudioEnabled = !_isAudioEnabled;
    });
    await _engine.enableLocalAudio(_isAudioEnabled);
  }

  void _toggleSpeaker() async {
    setState(() {
      _isSpeakerEnabled = !_isSpeakerEnabled;
    });
    await _engine.setEnableSpeakerphone(_isSpeakerEnabled);
  }

  void _endCall() async {
    if (!_callEnded) {
      setState(() {
        _callEnded = true;
        _localUserJoined = false;
        _remoteUid = null;
        _remainingSeconds = 0;
      });
      _countdownTimer?.cancel();
      _pulseController.stop();
      await _engine.leaveChannel();
      
      // Show end call dialog
      _showEndCallDialog();
    }
  }

  void _showEndCallDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Call Ended'),
          content: const Text('The audio call has ended.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _controlsTimer?.cancel();
    _pulseController.dispose();
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    await _engine.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      body: GestureDetector(
        onTap: _showControls,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2D3748),
                Color(0xFF1a1a1a),
                Color(0xFF0f0f0f),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Top section with status and timer
                _buildTopSection(),
                
                // Main content area
                Expanded(
                  child: _buildMainContent(),
                ),
                
                // Bottom controls
                _buildBottomControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return AnimatedOpacity(
      opacity: _controlsVisible ? 1.0 : 0.3,
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Connection status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: _remoteUid != null ? Colors.green.withOpacity(0.5) : Colors.orange.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _remoteUid != null ? Colors.green : Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _remoteUid != null ? 'Connected' : 'Connecting...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Timer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _remainingSeconds < 60 ? Colors.red.withOpacity(0.2) : Colors.black26,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: _remainingSeconds < 60 ? Colors.red.withOpacity(0.5) : Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                _formatDuration(_remainingSeconds),
                style: TextStyle(
                  color: _remainingSeconds < 60 ? Colors.red : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_callEnded) ...[
            // Animated audio wave/pulse effect
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _remoteUid != null ? _pulseAnimation.value : 1.0,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.purple.withOpacity(0.1),
                          Colors.transparent,
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.phone_in_talk,
                      size: 80,
                      color: Colors.white70,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            
            // Call status text
            Text(
              _remoteUid != null ? 'Audio Call Active' : 'Connecting to call...',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _remoteUid != null ? 'Call in progress' : 'Please wait for the other participant',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
          ] else ...[
            // Call ended state
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.1),
                border: Border.all(
                  color: Colors.red.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.call_end,
                size: 80,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Call Ended',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    if (_callEnded) return const SizedBox.shrink();
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(0, _controlsVisible ? 0 : 100, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mute/Unmute
            _buildControlButton(
              icon: _isAudioEnabled ? Icons.mic : Icons.mic_off,
              label: _isAudioEnabled ? 'Mute' : 'Unmute',
              color: _isAudioEnabled ? Colors.white : Colors.red,
              backgroundColor: _isAudioEnabled ? Colors.white.withOpacity(0.1) : Colors.red.withOpacity(0.2),
              borderColor: _isAudioEnabled ? Colors.white.withOpacity(0.3) : Colors.red.withOpacity(0.5),
              onPressed: _toggleAudio,
            ),
            
            // End Call
            _buildControlButton(
              icon: Icons.call_end,
              label: 'End Call',
              color: Colors.white,
              backgroundColor: Colors.red.withOpacity(0.8),
              borderColor: Colors.red,
              onPressed: _endCall,
              size: 70,
            ),
            
            // Speaker
            _buildControlButton(
              icon: _isSpeakerEnabled ? Icons.volume_up : Icons.volume_down,
              label: _isSpeakerEnabled ? 'Speaker' : 'Earpiece',
              color: _isSpeakerEnabled ? Colors.blue : Colors.white,
              backgroundColor: _isSpeakerEnabled ? Colors.blue.withOpacity(0.2) : Colors.white.withOpacity(0.1),
              borderColor: _isSpeakerEnabled ? Colors.blue.withOpacity(0.5) : Colors.white.withOpacity(0.3),
              onPressed: _toggleSpeaker,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color backgroundColor,
    required Color borderColor,
    required VoidCallback onPressed,
    double size = 60,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: size * 0.4,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}