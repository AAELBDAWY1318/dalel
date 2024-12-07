import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'souvenir_state.dart';

class SouvenirCubit extends Cubit<SouvenirState> {
  SouvenirCubit() : super(SouvenirInitial());
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('cart');
  addToCart(SouvenirModel souvenirModel) async {
    try {
      emit(AddToCartLoadingState());
      String userId = FirebaseAuth.instance.currentUser!.uid;
      Map<String, String> data = {
        FirebaseKeys.userId: userId,
        FirebaseKeys.title: souvenirModel.title,
        FirebaseKeys.image: souvenirModel.image,
        FirebaseKeys.price: souvenirModel.price,
        "id": souvenirModel.id,
      };
      await collectionRef.add(data);
      emit(AddToCartSuccessState());
    } catch (e) {
      emit(AddToCartFailureState(message: e.toString()));
    }
  }
}
