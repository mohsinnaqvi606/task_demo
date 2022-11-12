import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstallmentHistoryViewModel extends GetxController {
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
    final docRef = db.collection("installment_history").doc("P3Xh58l40ZpyR3ti2Vwr");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        valueController.text = data['installments'];
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
