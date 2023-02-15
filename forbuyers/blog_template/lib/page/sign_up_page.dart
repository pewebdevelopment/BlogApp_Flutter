import 'package:blog_template/cubit/sign_up_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/my_badge.dart';
import 'package:blog_template/widget/extended_button_panel.dart';
import 'package:blog_template/widget/link_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final locals = Locals.of(context);
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    final editFullName = TextEditingController();
    final editEmail = TextEditingController();
    final editAbout = TextEditingController();
    final editPassword = TextEditingController();
    final editConfirmPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Text(
                locals.helloSignUp,
                textAlign: TextAlign.center,
                style: headlineSmall,
              ),
              const SizedBox(height: 24.0),
              const MyBadge(icon: Icons.face),
              const SizedBox(height: 24.0),
              TextField(
                controller: editFullName,
                decoration: InputDecoration(label: Text(locals.fullName)),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: editEmail,
                decoration: InputDecoration(label: Text(locals.email)),
              ),
              const SizedBox(height: 8.0),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                controller: editAbout,
                decoration: InputDecoration(label: Text(locals.about)),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: editPassword,
                      decoration: InputDecoration(label: Text(locals.password)),
                    ),
                  ),
                  const SizedBox(width: 24.0),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: editConfirmPassword,
                      decoration:
                          InputDecoration(label: Text(locals.confirmPassword)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              LinkText(
                  text: locals.byClickingSignUp,
                  accentText: locals.termsConditions,
                  callback: () {
                    cubit.terms();
                  }),
              const SizedBox(height: 121.0),
            ],
          ),
          ExtendedButtonPanel(
            text: locals.alreadyHaveAccount,
            accentText: locals.logIn,
            textCallback: () {
              cubit.login(context);
            },
            buttonCaption: locals.signUp,
            buttonCallback: () {
              cubit.signUp(context);
            },
          ),
        ],
      ),
    );
  }
}
