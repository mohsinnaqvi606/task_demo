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
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          Loader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(height: 80, width: 80, color: Colors.red),
                Text('Hi'),
                phoneTextField(),
                verifyBtn()
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget phoneTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomTextField1(
        controller: viewModel.phoneController,
        prefixIcon: Icons.phone,
        title: 'Phone',
        keyboardType: TextInputType.phone,
        inputFormatters: [
           LengthLimitingTextInputFormatter(11),
        ],
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return viewModel.validateTextField(value);
        },
      ),
    );
  }

  Widget verifyBtn() {
    return CustomElevatedBtn(
      child: Text('Verify'),
      onPressed: (){
        viewModel.authentication();
      },
    );
  }
}
