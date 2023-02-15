import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<void> {
  ResetPasswordCubit() : super(0);

  void submit(BuildContext context) {
    Navigator.pop(context);
  }
}
