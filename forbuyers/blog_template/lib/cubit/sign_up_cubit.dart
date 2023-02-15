import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<void> {
  SignUpCubit() : super(0);

  void signUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("/");
  }

  void login(BuildContext context) {
    Navigator.of(context).pop();
  }

  void terms() {}
}
