import 'package:flutter/material.dart';
import 'package:safe_flare/pages/Account.dart';
import 'package:safe_flare/pages/Feedback.dart';
import 'package:safe_flare/pages/Notification.dart';
import 'package:safe_flare/pages/Customer_Support.dart';
import 'package:safe_flare/pages/Settings.dart';
import 'package:safe_flare/pages/Add_Device.dart';

class PageOptions {
  final Widget page;
  final String title;

  PageOptions({required this.page, required this.title});
}

class PageRouter {
  static List<PageOptions> pages = [
    PageOptions(page: FeedbackPage(), title: "Feedback"),
    PageOptions(page: Notifications(), title: "Notification"),
    PageOptions(page: Account(), title: "Account"),
    PageOptions(page: ChatScreen(), title: "CustomerSupport"),
    PageOptions(page: SettingsPage(), title: "Setting"),
    PageOptions(page: AddDevicePage(), title: "AddDevice"),
  ];

  static PageRoute<dynamic> getPageRoute(int index) {
    return MaterialPageRoute(builder: (context) {
      return pages[index].page;
    });
  }
}