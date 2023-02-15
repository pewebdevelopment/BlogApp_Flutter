import 'package:blog_template/app_theme.dart';
import 'package:blog_template/cubit/login_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/my_badge.dart';
import 'package:blog_template/widget/extended_button_panel.dart';
import 'package:blog_template/widget/link_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    final themeData = Theme.of(context);
    final locals = Locals.of(context);

    final headlineSmall = themeData.textTheme.headlineSmall;
    final secondaryLabelLarge = themeData.textTheme.labelLarge
        ?.copyWith(color: AppTheme.secondaryTextColor(context));

    final editUsername = TextEditingController();
    final editPassword = TextEditingController();

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              const SizedBox(height: 60.0),
              Text(
                locals.welcomeLogIn,
                textAlign: TextAlign.center,
                style: headlineSmall,
              ),
              const SizedBox(height: 24.0),
              const MyBadge(icon: Icons.spa),
              const SizedBox(height: 24.0),
              TextField(
                controller: editUsername,
                decoration: InputDecoration(label: Text(locals.username)),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: editPassword,
                decoration: InputDecoration(label: Text(locals.password)),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.setRememberMe(!cubit.rememberMe);
                    },
                    child: Text(locals.rememberMe, style: secondaryLabelLarge),
                  ),
                  BlocBuilder<LoginCubit, bool>(
                    builder: (context, rememberMe) {
                      return Checkbox(
                          activeColor: themeData.colorScheme.primary,
                          value: rememberMe,
                          onChanged: (newValue) =>
                              cubit.setRememberMe(newValue ?? false));
                    },
                  ),
                  const Spacer(),
                  LinkLabel(
                    caption: locals.forgotPassword,
                    callback: (context) {
                      cubit.resetPassword(context: context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 121.0)
            ],
          ),
          ExtendedButtonPanel(
            text: locals.dontHaveAccount,
            accentText: locals.signUp,
            textCallback: () {
              cubit.signUp(context);
            },
            buttonCaption: locals.logIn,
            buttonCallback: () {
              cubit.login(context, editUsername.text, editPassword.text);
            },
          ),
        ],
      ),
    );
  }
}
