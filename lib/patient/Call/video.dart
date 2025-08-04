import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:consult_me/core/notifications/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// const appId = "c74d620ba147479ea30543c30b9dc1c6";
// const token =
//     "006c74d620ba147479ea30543c30b9dc1c6IAAD7EccgTf+1g/d5s+h2cQmvDaVke1QWH7qBtfW7vPC8gChFglCsDk/GgAEAAEAvGqHaAIAvGqHaAMAvGqHaAQAvGqHaA==";
// const channel = "e7754500-9802-4654-9a42-4ae724d88d62";

class Video extends StatefulWidget {
 final AgoraCallModel model;
  const Video({super.key,required this.model});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  Timer? _countdownTimer;
  late int _remainingSeconds ;// 3 minutes
  bool _callEnded = false;

  @override
  void initState() {
     _remainingSeconds = int.parse(widget.model.durationInMinutes);
    super.initState();
    initAgora();
    _startCountdownTimer();

  }

  Future<void> initAgora() async {
    // Retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    // Create the engine
   final id = widget.model.callId;
    _engine = createAgoraRtcEngine();
    await _engine.initialize( RtcEngineContext(
      appId: id,
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
      token: widget.model.agoraToken,
      channelId: widget.model.channelName,
      uid: 17,
      options: const ChannelMediaOptions(),
    );
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel(); // Cancel any existing timer
    _remainingSeconds = 10; // Reset to 3 minutes
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
      appBar: AppBar(
        title: const Text('Agora Video Call'),
        actions: [
          if (!_callEnded)
            IconButton(
              icon: const Icon(Icons.call_end, color: Colors.red),
              onPressed: _endCall,
            ),
        Text(_formatDuration( _remainingSeconds)),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
         if(!_callEnded)
         
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: 
                    
                  _localUserJoined ?  AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
          // if (_callEnded)
          //   Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       padding: const EdgeInsets.all(8.0),
          //       color: Colors.black54,
          //       child: Text(
          //         'Call ended. Time remaining: ${_formatDuration(_remainingSeconds)}',
          //         style: const TextStyle(color: Colors.white, fontSize: 16),
          //       ),
          //     ),
          //   ),
       
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
          connection:  RtcConnection(channelId: widget.model.channelName),
        ),
      );
    } 
    else {
      return Text(
        _callEnded ? 'Call ended' : 'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
 
  }
}