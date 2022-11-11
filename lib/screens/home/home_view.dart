import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: DrawerWidget(),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
    );
  }
}
