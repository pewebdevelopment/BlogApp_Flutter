import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<bool> {
  bool rememberMe = false;

  LoginCubit() : super(false);

  void login(BuildContext context, String username, String password) {
    Navigator.of(context).pushReplacementNamed("/");
  }

  void signUp(BuildContext context) {
    Navigator.of(context).pushNamed("/login/signup");
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    emit(rememberMe);
  }

  void resetPassword({required BuildContext context}) {
    Navigator.of(context).pushNamed("/login/resetpassword");
  }
}
