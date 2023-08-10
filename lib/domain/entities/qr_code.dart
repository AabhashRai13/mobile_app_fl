class QrCode {
  final String qrId;
  final String link;

  const QrCode({required this.qrId, required this.link});

  factory QrCode.fromJson(Map<String, dynamic> json) => QrCode(
        qrId: json["qrID"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "qrID": qrId,
        "link": link,
      };
}