class Authentication {
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final bool isAdmin;
  final bool isPrinter;
  final String? qrId;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? accessToken;
  final String? imageUrl;

  Authentication(
      {this.username,
      this.email,
      this.password,
      required this.isAdmin,
      required this.isPrinter,
      this.qrId,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.accessToken,
      this.phoneNumber,
      this.imageUrl});
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "isAdmin": isAdmin,
        "isPrinter": isPrinter,
        "updatedAt": updatedAt,
        "phoneNumber": phoneNumber
      };
}
