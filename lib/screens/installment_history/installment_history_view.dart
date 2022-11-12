import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/installment_history/installment_history_viewmodel.dart';
import 'package:task_demo/screens/plot_detail/plot_detail_viewmodel.dart';
import 'package:task_demo/widgets/custom_drawer.dart';
import 'package:task_demo/widgets/custom_elevated_btn.dart';
import 'package:task_demo/widgets/custom_textfields.dart';

class InstallmentHistoryView extends StatelessWidget {
  InstallmentHistoryView({Key? key}) : super(key: key);
  final InstallmentHistoryViewModel viewModel =
      Get.put(InstallmentHistoryViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar(),
          drawer: DrawerWidget(),
          body: Center(
            child: detailTextField(),
          )),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Installment History'),
      centerTitle: true,
    );
  }

  Widget detailTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomTextField1(
        controller: viewModel.valueController,
        prefixIcon: Icons.vertical_align_bottom_outlined,
        title: 'Installments',
        hintText: '',
      ),
    );
  }
}
