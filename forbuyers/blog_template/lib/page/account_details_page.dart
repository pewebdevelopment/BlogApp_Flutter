import 'package:blog_template/cubit/account_details_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/button_panel.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/user_avatar_with_edit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountDetailsCubit>();
    final locals = Locals.of(context);
    final editFullName = TextEditingController();
    final editEmail = TextEditingController();
    final editAbout = TextEditingController();

    cubit.getUser();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.accountDetails),
      ),
      body: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
        builder: (context, state) {
          if (state is InitialAccountDetailsState) {
            return const Loading();
          } else {
            state as LoadedAccountDetailsState;

            editFullName.text = state.fullName;
            editEmail.text = state.email;
            editAbout.text = state.about;

            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    const SizedBox(height: 24.0),
                    _centeredUserAvatarWithEditButton(state, context, locals),
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
                    const SizedBox(height: 88.0),
                  ],
                ),
                ButtonPanel(
                  caption: locals.save,
                  callback: () {
                    cubit.save(context, editFullName.text, editEmail.text,
                        editAbout.text);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Row _centeredUserAvatarWithEditButton(
      LoadedAccountDetailsState state, BuildContext context, Locals locals) {
    return Row(
      children: [
        const Spacer(),
        UserAvatarWithEditButton(
          image: state.image,
          callback: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(locals.editPhotoTapped)),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
