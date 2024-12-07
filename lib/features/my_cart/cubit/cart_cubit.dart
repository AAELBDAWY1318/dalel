import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/models/cart_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

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
}
