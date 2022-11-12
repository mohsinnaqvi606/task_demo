import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/login/login_viewmodel.dart';
import 'package:task_demo/widgets/custom_elevated_btn.dart';
import 'package:task_demo/widgets/custom_textfields.dart';
import 'package:task_demo/widgets/loader.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginViewModel viewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff363636),
        body: Stack(
          children: [
            const Loader(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  logo(),
                  const SizedBox(height: 30),
                  welcomeText(),
                  signInText(),
                  Container(
                    height: Get.height * 0.425,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: viewModel.loginFormKey,
                          child: phoneTextField(),
                        ),
                        const SizedBox(height: 20),
                        verifyBtn(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/images/logo.png',
      width: Get.width * 0.4,
    );
  }

  Widget welcomeText() {
    return Column(
      children: [
        const Text(
          'Welcome to',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Pak ',
              style: TextStyle(
                  color: Color(0xff5faf40),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              ' Residencia',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }

  Widget signInText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 45.0),
      child: Text(
        'Sign in to continue',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget phoneTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomTextField1(
        controller: viewModel.phoneController,
        prefixIcon: Icons.phone,
        title: 'Phone',
        hintText: '03xxxxxxxxx',
        keyboardType: TextInputType.numberWithOptions(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return viewModel.validateTextField(value);
        },
      ),
    );
  }

  Widget verifyBtn() {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedBtn(
        backgroundColor: const Color(0xff8ec74a),
        child: const Text(
          'LOGIN',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        onPressed: () {
          viewModel.authentication();
        },
      ),
    );
  }
}
