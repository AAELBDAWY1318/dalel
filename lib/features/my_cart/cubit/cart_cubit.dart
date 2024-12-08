import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/models/cart_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<double> paymentList = [];
  List<String> ids = [];
  double sum = 0;
  int count = 1;
  bool checkValue = false;

  getMyCart() {
    try {
      emit(GetMyCartLoading());
      String userId = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance.collection("cart").get().then((value) {
        List<CartModel> documents = [];
        for (var doc in value.docs) {
          Map<String, dynamic> data = doc.data();
          if (data[FirebaseKeys.userId] == userId) {
            documents.add(CartModel.fromJson(data));
          }
        }
        emit(GetMyCartSuccess(myCartList: documents));
      }).catchError((e) {
        emit(GetMyCartFailure(errorMessage: e.toString()));
      });
    } catch (e) {
      emit(GetMyCartFailure(errorMessage: e.toString()));
    }
  }

  getTotalPayment() {
    for (int i = 0; i < paymentList.length; i++) {
      sum += paymentList[i];
      log("calculate: ${paymentList[i]}");
    }
    emit(ChangePaymentState());
  }

  Future<void> deleteDocumentsByField({
    required String collectionPath,
    required String fieldName,
    required List<String> fieldValues,
  }) async {
    try {
      emit(DeleteFromCartLoading());
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Iterate over the list of field values
      for (var value in fieldValues) {
        QuerySnapshot querySnapshot = await firestore
            .collection(collectionPath)
            .where(fieldName, isEqualTo: value)
            .get();

        // Delete each matching document
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          await doc.reference.delete();
          log("Deleted document with ID: ${doc.id}");
        }
      }
      emit(DeleteFromCartSuccess());
    } catch (e) {
      emit(DeleteFromCartFailure(errorMessage: e.toString()));
    }
  }
}
