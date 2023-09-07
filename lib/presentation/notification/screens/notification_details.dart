import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/resources/style_constants.dart';
import 'package:flutter/material.dart';

import 'package:find_scan_return_app/domain/entities/notification.dart' as not;
import 'package:intl/intl.dart';

class NotificationDetailPage extends StatefulWidget {
  final not.Notification notification;
  const NotificationDetailPage({Key? key, required this.notification})
      : super(key: key);

  @override
  NotificationDetailPageState createState() => NotificationDetailPageState();
}

class NotificationDetailPageState extends State<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(AppStrings.notification),
      ),
      body: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(getProportionateScreenWidth(10)),
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(color: Colors.grey[300]!, blurRadius: 2.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.notification.name ?? "", style: headingStyle),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              Text("Mail: ${widget.notification.email ?? ""}",
                  style: detailTextStyle),
              const SizedBox(height: 16.0),
              Text("Phone number: ${widget.notification.phoneNumber ?? ""}",
                  style: detailTextStyle),
              const SizedBox(height: 16.0),
              Text("Location of finding: ${widget.notification.location ?? ""}",
                  style: detailTextStyle),
              const SizedBox(height: 16.0),
              Text("Message: ${widget.notification.customMsg ?? ""}",
                  style: detailTextStyle),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    "Date: ${DateFormat('EEEE MMM d h:mm a').format(DateTime.parse(widget.notification.timestamp!))}",
                    style: dateStyle),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
