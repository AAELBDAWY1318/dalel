import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getUserData() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      emit(GetUserDataLoading());
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("user");
      DocumentReference documentReference = collectionReference.doc(userId);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      if (data[FirebaseKeys.image] == null) {
        data[FirebaseKeys.image] =
            "https://i.pinimg.com/originals/0d/42/90/0d42905fc5e9d14fa032d8ea0282bf68.jpg";
        await documentReference.update(data);
      }
      emit(GetUserDataSuccess(
          firstName: data["firstName"],
          lastName: data["secondName"],
          image: data[FirebaseKeys.image],
          email: data["email"]));
    } catch (e) {
      emit(GetUserDataFailure(errorMessage: e.toString()));
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
}
