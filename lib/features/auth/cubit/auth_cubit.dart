import 'package:bloc/bloc.dart';
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
  }
}
