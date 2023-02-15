import 'package:blog_template/cubit/change_password_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/my_badge.dart';
import 'package:blog_template/widget/button_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    final locals = Locals.of(context);
    final editCurrentPassword = TextEditingController();
    final editNewPassword = TextEditingController();
    final editConfirmNewPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.changePassword),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              const SizedBox(height: 24.0),
              const MyBadge(icon: Icons.lock),
              const SizedBox(height: 24.0),
              TextField(
                controller: editCurrentPassword,
                decoration:
                    InputDecoration(label: Text(locals.currentPassword)),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: editNewPassword,
                decoration: InputDecoration(label: Text(locals.newPassword)),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: editConfirmNewPassword,
                decoration:
                    InputDecoration(label: Text(locals.confirmNewPassword)),
              ),
              const SizedBox(height: 88.0),
            ],
          ),
          ButtonPanel(
            caption: locals.save,
            callback: () {
              cubit.save(context);
            },
          ),
        ],
      ),
    );
  }
}
