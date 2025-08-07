class MyCallModel {
  final int? id;
  final int? doctorId;
  final int? patientId;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final String? channelName;
  final String? agoraToken;
  final int? durationInMinutes;

  MyCallModel({
    this.id,
    this.doctorId,
    this.patientId,
    this.startedAt,
    this.endedAt,
    this.channelName,
    this.agoraToken,
    this.durationInMinutes,
  });

  factory MyCallModel.fromJson(Map<String, dynamic> json) {
    return MyCallModel(
      id: json['id'] as int?,
      doctorId: json['doctorId'] as int?,
      patientId: json['patientId'] as int?,
      startedAt: json['startedAt'] != null ? DateTime.tryParse(json['startedAt']) : null,
      endedAt: json['endedAt'] != null ? DateTime.tryParse(json['endedAt']) : null,
      channelName: json['channelName'] as String?,
      agoraToken: json['agoraToken'] as String?,
      durationInMinutes: json['durationInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'patientId': patientId,
      'startedAt': startedAt?.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'channelName': channelName,
      'agoraToken': agoraToken,
      'durationInMinutes': durationInMinutes,
    };
  }
}
