import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:consult_me/features/call/data/models/call_model.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "c74d620ba147479ea30543c30b9dc1c6";

class Video extends StatefulWidget {
  final CallModel call;

  const Video({super.key, required this.call});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  Timer? _countdownTimer;
 late int _remainingSeconds ;
  bool _callEnded = false;
  bool _isVideoEnabled = true;
  bool _isAudioEnabled = true;
  bool _controlsVisible = true;
  Timer? _controlsTimer;

  @override
  void initState() {
    super.initState();
    initAgora();
    _startCountdownTimer();
    _startControlsTimer();
  }

  Future<void> initAgora() async {
    // Retrieve permissions
setState(() {
      _remainingSeconds = widget.call.durationInMinutes;

});
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

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: widget.call.agoraToken,
      channelId: widget.call.channelName,
      uid: 17,
      options: const ChannelMediaOptions(),
    );
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel();
    _remainingSeconds = widget.call.durationInMinutes; // Reset to initial time
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
    _controlsTimer = Timer(const Duration(seconds: 3), () {
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

  void _toggleVideo() async {
    setState(() {
      _isVideoEnabled = !_isVideoEnabled;
    });
    await _engine.enableLocalVideo(_isVideoEnabled);
  }

  void _toggleAudio() async {
    setState(() {
      _isAudioEnabled = !_isAudioEnabled;
    });
    await _engine.enableLocalAudio(_isAudioEnabled);
  }

  void _switchCamera() async {
    await _engine.switchCamera();
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
          title: const Text('Call Ended'),
          content: const Text('The video call has ended.'),
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
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    await _engine.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _showControls,
        child: Stack(
          children: [
            // Remote video (full screen)
            Positioned.fill(
              child: _remoteVideo(),
            ),
            
            // Local video preview (picture-in-picture)
            if (!_callEnded && _localUserJoined)
              Positioned(
                top: 60,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    // Optional: Allow switching to full screen local video
                  },
                  child: Container(
                    width: 120,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Top bar with timer and connection status
            AnimatedOpacity(
              opacity: _controlsVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _remainingSeconds < 60 ? Colors.red.withOpacity(0.8) : Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _formatDuration(_remainingSeconds),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom controls
            if (!_callEnded)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                bottom: _controlsVisible ? 40 : -100,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildControlButton(
                        icon: _isAudioEnabled ? Icons.mic : Icons.mic_off,
                        color: _isAudioEnabled ? Colors.white : Colors.red,
                        backgroundColor: _isAudioEnabled ? Colors.black54 : Colors.red.withOpacity(0.8),
                        onPressed: _toggleAudio,
                      ),
                      _buildControlButton(
                        icon: Icons.call_end,
                        color: Colors.white,
                        backgroundColor: Colors.red,
                        onPressed: _endCall,
                        size: 60,
                      ),
                      _buildControlButton(
                        icon: _isVideoEnabled ? Icons.videocam : Icons.videocam_off,
                        color: _isVideoEnabled ? Colors.white : Colors.red,
                        backgroundColor: _isVideoEnabled ? Colors.black54 : Colors.red.withOpacity(0.8),
                        onPressed: _toggleVideo,
                      ),
                    ],
                  ),
                ),
              ),

            // Switch camera button
            if (!_callEnded && _controlsVisible && _isVideoEnabled)
              Positioned(
                bottom: 160,
                right: 40,
                child: _buildControlButton(
                  icon: Icons.cameraswitch,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                  onPressed: _switchCamera,
                  size: 48,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onPressed,
    double size = 56,
  }) {
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
        child: Icon(
          icon,
          color: color,
          size: size * 0.4,
        ),
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null && !_callEnded) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.call.channelName),
        ),
      );
    } else if (_callEnded) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.call_end,
                size: 80,
                color: Colors.white54,
              ),
              SizedBox(height: 20),
              Text(
                'Call Ended',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Connecting...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please wait for the other participant to join',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}