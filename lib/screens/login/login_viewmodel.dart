import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/home/home_view.dart';
import 'package:task_demo/widgets/getx_helper.dart';
import 'package:task_demo/widgets/loader.dart';

class LoginViewModel extends GetxController {
  TextEditingController phoneController = TextEditingController();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  String? validateTextField(String? value) {
    if (value == '' || value == null) {
      return "Field required";
    } else {
      return null;
    }
  }

  authentication() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    Loader.loader.value = true;
    print('+92${phoneController.text.replaceFirst('0', '')}');
    auth.verifyPhoneNumber(
      phoneNumber: '+92${phoneController.text.replaceFirst('0', '')}',
      verificationCompleted: (AuthCredential authCredential) {
        Loader.loader.value = false;
        Get.offAll(() => const HomeView());
      },
      verificationFailed: (FirebaseAuthException authException) {
        Loader.loader.value = false;
        GetxHelper.showSnackBar1(
            title: 'Error', message: "${authException.message}");
      },
      codeAutoRetrievalTimeout: (String value) {
        Loader.loader.value = false;
        GetxHelper.showSnackBar1(title: 'Error', message: "Timeout error");
      },
      codeSent: (String verificationId, int? forceResendingToken) {},
    );
  }
}
