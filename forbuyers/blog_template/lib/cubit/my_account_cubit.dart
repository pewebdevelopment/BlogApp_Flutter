import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/user.dart';
import 'package:blog_template/navigation/navigator_keys.dart';
import 'package:blog_template/navigation/posts_page_parameters.dart';
import 'package:blog_template/service/service.dart';
import 'package:blog_template/service/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  final Service service = getIt<Service>();

  MyAccountCubit() : super(const InitialMyAccountState());

  void getUser() async {
    final user = await service.getUser(Globals.loggedUserId);
    emit(LoadedMyAccountState(user));
  }

  void bookmarks(BuildContext context) {
    const params =
        PostsPageParameters(onlyBookmarkeds: true, sortBy: SortBy.newToOld);
    Navigator.of(context).pushNamed("/bookmarks", arguments: params);
  }

  void myComments(BuildContext context) {
    Navigator.of(context).pushNamed("/mycomments");
  }

  void accountDetails(BuildContext context) {
    Navigator.of(context).pushNamed("/accountdetails").then((_) => getUser());
  }

  void changePassword(BuildContext context) {
    Navigator.of(context).pushNamed("/changepassword");
  }

  void logOut() {
    Navigator.of(NavigatorKeys.main.currentContext!)
        .pushReplacementNamed("/login");
  }
}

@immutable
abstract class MyAccountState {
  const MyAccountState();
}

class InitialMyAccountState extends MyAccountState {
  const InitialMyAccountState() : super();
}

class LoadedMyAccountState extends MyAccountState {
  final User _user;

  get userFullName => _user.fullName;
  get userImage => _user.image;

  const LoadedMyAccountState(this._user) : super();
}
