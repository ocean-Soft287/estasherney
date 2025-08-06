class CallModel {
  final int callId;
  final String channelName;
  final String agoraToken;
  final DateTime startedAt;
  final int durationInMinutes;

  CallModel({
    required this.callId,
    required this.channelName,
    required this.agoraToken,
    required this.startedAt,
    required this.durationInMinutes,
  });

  // Factory constructor for creating a Call from JSON
  factory CallModel.fromJson(Map<String, dynamic> json) {
    return CallModel(
      callId: json['callId'] as int,
      channelName: json['channelName'] as String,
      agoraToken: json['agoraToken'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      durationInMinutes: json['durationInMinutes'] as int,
    );
  }

  // Method to convert a Call to JSON
  Map<String, dynamic> toJson() {
    return {
      'callId': callId,
      'channelName': channelName,
      'agoraToken': agoraToken,
      'startedAt': startedAt.toIso8601String(),
      'durationInMinutes': durationInMinutes,
    };
  }


}