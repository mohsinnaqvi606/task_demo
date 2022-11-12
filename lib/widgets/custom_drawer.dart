import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/home/home_view.dart';
import 'package:task_demo/screens/installment_history/installment_history_view.dart';
import 'package:task_demo/screens/login/login_view.dart';
import 'package:task_demo/screens/notification/notification_view.dart';
import 'package:task_demo/screens/plot_detail/plot_detail_view.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: Drawer(
        child: ListView(
            children: ListTile.divideTiles(
          context: context,
          tiles: [
            drawerItem(
                title: 'Home',
                icon: Icons.home,
                onTap: () {
                  Get.back();
                  Get.to(() => HomeView());
                }),
            drawerItem(
                title: 'Plot Details',
                icon: Icons.details_sharp,
                iconSize: 16,
                onTap: () {
                  Get.back();
                  Get.to(() => PlotDetailView());
                }),
            drawerItem(
                title: 'Installments History',
                icon: Icons.line_style,
                onTap: () {
                  Get.back();
                  Get.to(() => InstallmentHistoryView());
                }),
            drawerItem(
                title: 'Notifications',
                icon: Icons.notification_important,
                onTap: () {
                  Get.back();
                  Get.to(() => NotificationView());
                }),
            drawerItem(
              title: 'Logout',
              icon: Icons.exit_to_app,
              onTap: () {
                Get.back();
                // GetStorage().remove('user_id');
                // GetStorage().remove('rememberMe');
                Get.offAll(() => LoginView());
              },
            ),
          ],
        ).toList()),
      ),
    );
  }

  Widget drawerItem(
      {String title = '',
      required IconData icon,
      double iconSize = 19,
      required GestureTapCallback onTap}) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: -14,
      dense: true,
      contentPadding: EdgeInsets.only(left: 10),
      leading: Icon(
        icon,
        size: iconSize,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto-Regular',
          //fontWeight: FontWeight.w00
        ),
      ),
    );
  }
}
