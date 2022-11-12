import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlotDetailViewModel extends GetxController {
  TextEditingController valueController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    valueController.dispose();
    super.onClose();
  }


  getData() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("plot_detail").doc("ps80MaVSKUt2gSrsJDnQ");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        valueController.text = data['plot_name'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
