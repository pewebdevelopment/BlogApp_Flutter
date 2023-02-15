import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/user.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsCubit extends Cubit<AccountDetailsState> {
  final Service service = getIt<Service>();

  AccountDetailsCubit() : super(const InitialAccountDetailsState());

  void getUser() async {
    final user = await service.getUser(Globals.loggedUserId);
    emit(LoadedAccountDetailsState(user));
  }

  void save(
    BuildContext context,
    String fullName,
    String email,
    String about,
  ) async {
    if (state is LoadedAccountDetailsState) {
      final loadedState = state as LoadedAccountDetailsState;

      final user = User(
          id: loadedState.id,
          fullName: fullName,
          about: about,
          email: email,
          image: loadedState.image);

      await service.updateUser(user).then((value) => Navigator.pop(context));
    }
  }
}

@immutable
abstract class AccountDetailsState {
  const AccountDetailsState();
}

class InitialAccountDetailsState extends AccountDetailsState {
  const InitialAccountDetailsState() : super();
}

class LoadedAccountDetailsState extends AccountDetailsState {
  final User _user;

  get id => _user.id;
  get fullName => _user.fullName;
  get about => _user.about;
  get email => _user.email;
  get image => _user.image;

  const LoadedAccountDetailsState(this._user) : super();
}
