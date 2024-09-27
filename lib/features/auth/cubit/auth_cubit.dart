import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/features/auth/cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  bool obscureText = true;
  IconData icon = Icons.visibility_off;
  bool check = false;
  TextEditingController fristName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetpasswordKey = GlobalKey<FormState>();
  changeEyeIcon() {
    obscureText = !obscureText;
    if (obscureText) {
      icon = Icons.visibility_off;
    } else {
      icon = Icons.visibility;
    }
    emit(IconButtonEyeChangeState());
  }

  changeCheckBox() {
    check = !check;
    emit(CheckBoxTermAndConditionsChangeState());
  }

  createAccountWithEmailAndPassword() async {
    try {
      emit(SignUpLoading());
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      sendVerificationLink();
      saveUserData(uid: user.user!.uid);
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailure(errorMessage: 'The email is not valide'));
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }

  login() async {
    try {
      emit(SignInLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailure(errorMessage: e.code));
      }
    }
  }

  sendVerificationLink() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  saveUserData({required String uid}) async {
    final user = FirebaseFirestore.instance.collection("user");
    user.doc(uid).set({
      "uid": uid,
      "firstName": fristName.text,
      "secondName": lastName.text,
      "email": email.text,
    });
  }

  bool checkVerificationStatus() {
    log("${FirebaseAuth.instance.currentUser!}");
    return FirebaseAuth.instance.currentUser!.emailVerified;
  }

  resetPassword() async {
    try {
      emit(ResetPasswordLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(errorMessage: "Error, please try again"));
    }
  }
}
