import 'package:blog_template/cubit/my_account_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/button_panel.dart';
import 'package:blog_template/widget/chic_button.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyAccountCubit>();
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final locals = Locals.of(context);

    cubit.getUser();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.myAccount),
      ),
      body: BlocBuilder<MyAccountCubit, MyAccountState>(
        builder: (context, state) {
          if (state is InitialMyAccountState) {
            return const Loading();
          } else {
            state as LoadedMyAccountState;
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    const SizedBox(height: 24.0),
                    UserAvatar(image: "assets/${state.userImage}.jpg"),
                    const SizedBox(height: 24.0),
                    Text(
                      state.userFullName,
                      textAlign: TextAlign.center,
                      style: titleLarge,
                    ),
                    const SizedBox(height: 24.0),
                    ChicButton(
                      icon: Icons.bookmark,
                      caption: locals.bookmarks,
                      callback: () {
                        cubit.bookmarks(context);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ChicButton(
                      icon: Icons.comment,
                      caption: locals.myComments,
                      callback: () {
                        cubit.myComments(context);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ChicButton(
                        icon: Icons.person,
                        caption: locals.accountDetails,
                        callback: () {
                          cubit.accountDetails(context);
                        }),
                    const SizedBox(height: 16.0),
                    ChicButton(
                      icon: Icons.lock,
                      caption: locals.changePassword,
                      callback: () {
                        cubit.changePassword(context);
                      },
                    ),
                    const SizedBox(height: 88),
                  ],
                ),
                ButtonPanel(
                  caption: locals.logOut,
                  callback: () {
                    cubit.logOut();
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}
