import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<void> {
  ChangePasswordCubit() : super(0);

  void save(BuildContext context) {
    Navigator.pop(context);
  }
}
