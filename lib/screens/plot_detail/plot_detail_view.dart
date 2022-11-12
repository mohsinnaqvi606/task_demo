import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_demo/screens/plot_detail/plot_detail_viewmodel.dart';
import 'package:task_demo/widgets/custom_drawer.dart';
import 'package:task_demo/widgets/custom_elevated_btn.dart';
import 'package:task_demo/widgets/custom_textfields.dart';

class PlotDetailView extends StatelessWidget {
  PlotDetailView({Key? key}) : super(key: key);
  final PlotDetailViewModel viewModel = Get.put(PlotDetailViewModel());

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
      title: const Text('Plot Detail'),
      centerTitle: true,
    );
  }

  Widget detailTextField() {
    return Padding(
      padding:  const EdgeInsets.all(20.0),
      child: CustomTextField1(
         controller: viewModel.valueController,
        prefixIcon: Icons.vertical_align_bottom_outlined,
        title: 'Plot Location',
        hintText: '',
      ),
    );
  }
}
