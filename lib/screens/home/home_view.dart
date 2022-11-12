import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/login/login_view.dart';
import 'package:task_demo/widgets/custom_drawer.dart';
import 'package:task_demo/widgets/custom_elevated_btn.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(
                vertical: 20, horizontal: Get.width * 0.15),
            child: Column(
              children: [
                profileImage(),
                userName(),
                designation(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    itemView(
                        title: 'Plots', value: '3', icon: Icons.home_outlined),
                    itemView(
                        title: 'Paid Amount',
                        value: '120k',
                        icon: Icons.currency_exchange_rounded)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    itemView(
                        title: 'Installments Left',
                        value: '20',
                        icon: Icons.calculate_outlined),
                    itemView(
                        title: 'Remaining Charges',
                        value: '350k',
                        icon: Icons.attach_money_rounded)
                  ],
                ),
                const SizedBox(height: 20),
                logoutBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
    );
  }

  Widget profileImage() {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: const Color(0xff8ec74a),
          ),
          borderRadius: BorderRadius.circular(80),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/profile.jpg'))),
    );
  }

  Widget userName() {
    return const Text(
      'Muhammad Ali',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color(0xff8ec74a),
      ),
    );
  }

  Widget designation() {
    return const Text(
      'Engineer',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xff929292),
      ),
    );
  }

  Widget itemView(
      {required String title, required String value, required IconData icon}) {
    return Container(
      width: Get.width * 0.33,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xff8ec74a),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 80,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget logoutBtn() {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedBtn(
        backgroundColor: const Color(0xff8ec74a),
        child: const Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        onPressed: () {
          Get.offAll(() => LoginView());
        },
      ),
    );
  }
}
