import 'package:blog_template/app_theme.dart';
import 'package:blog_template/cubit/reset_password_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/my_badge.dart';
import 'package:blog_template/widget/button_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    final locals = Locals.of(context);
    final editEmail = TextEditingController();
    final secondaryBodyLarge = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(color: AppTheme.secondaryTextColor(context));

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.resetMyPassword),
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
                controller: editEmail,
                decoration: InputDecoration(label: Text(locals.email)),
              ),
              const SizedBox(height: 24.0),
              Text(
                locals.pleaseTypeYourEmail,
                style: secondaryBodyLarge,
              ),
              const SizedBox(height: 88.0),
            ],
          ),
          ButtonPanel(
            caption: locals.submit,
            callback: () {
              cubit.submit(context);
            },
          ),
        ],
      ),
    );
  }
}
