import 'dart:developer';

import 'package:find_scan_return_app/presentation/notification/screens/notification_screens.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/userDetails/user_details_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String? pageIndex;

  const Home({Key? key, this.pageIndex}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Widget> _screens = [
    // Content for Home tab
    const ProfileScreen(),

    // Content for Favorites tab
    const NotificationList(),
  ];

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();

    if (widget.pageIndex != null) {
      log("index");
      log(widget.pageIndex!);
      setState(() {
        _selectedIndex = int.parse(widget.pageIndex!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          height: getProportionateScreenHeight(50),
          color: ColorManager.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
            ],
          )),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Expanded(child: _screens[_selectedIndex])],
      ),
    );
  }
}
