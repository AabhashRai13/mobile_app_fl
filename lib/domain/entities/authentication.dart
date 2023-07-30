class Authentication {
  final String? username;
  final String? email;
  final String? password;
  final bool isAdmin;
  final bool isPrinter;
  final String? qrId;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? accessToken;

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
      this.accessToken});
}
