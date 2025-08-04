class AgoraCallModel {
  final String callId;
  final String channelName;
  final String agoraToken;
  final String startedAt;
  final String durationInMinutes;

  AgoraCallModel({
    required this.callId,
    required this.channelName,
    required this.agoraToken,
    required this.startedAt,
    required this.durationInMinutes,
  });

  // Convert JSON to Dart object
  factory AgoraCallModel.fromJson(Map<String, dynamic> json) {
    return AgoraCallModel(
      callId: json['callId'] as String,
      channelName: json['channelName'] as String,
      agoraToken: json['agoraToken'] as String,
      startedAt: json['startedAt']as String , // Automatically handles ISO8601 with timezone
      durationInMinutes: json['durationInMinutes'] as String,
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'callId': callId,
      'channelName': channelName,
      'agoraToken': agoraToken,
      'startedAt': startedAt,
      'durationInMinutes': durationInMinutes,
    };
  }

  @override
  String toString() {
    return 'AgoraCallModel(callId: $callId, channelName: $channelName, startedAt: $startedAt, durationInMinutes: $durationInMinutes)';
  }
}