import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/presentation/notification/bloc/notification_bloc.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/widgets/widget/notification_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_details.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  NotificationListState createState() => NotificationListState();
}

class NotificationListState extends State<NotificationList> {
  final NotificationBloc notificationBloc = sl<NotificationBloc>();
  @override
  void initState() {
    super.initState();
    notificationBloc.add(FetchNotification());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(AppStrings.notification),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        builder: (context, state) {
          if (state is NotificationsLoaded) {
            return ListView.separated(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.notificationsLoaded.length,
                itemBuilder: (context, index) {
                  return NotificationTiles(
                    title: state.notificationsLoaded[index].name,
                    subtitle: state.notificationsLoaded[index].customMsg ??
                        state.notificationsLoaded[index].phoneNumber ??
                        state.notificationsLoaded[index].email ??
                        "",
                    enable: true,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationDetailPage(
                              notification: state.notificationsLoaded[index],
                            ))),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                });
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
