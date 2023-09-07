import 'package:find_scan_return_app/domain/entities/notification.dart';

class NotificationModel extends Notification {
  NotificationModel({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? location,
    String? customMsg,
    String? timestamp,
    int? v,
  }) : super(
            id: id,
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            location: location,
            customMsg: customMsg,
            timestamp: timestamp);
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        location: json["location"],
        customMsg: json["customMsg"],
        timestamp: json["timestamp"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "location": location,
        "customMsg": customMsg,
        "timestamp": timestamp,
        "__v": v,
      };
}