import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/comment.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCommentsCubit extends Cubit<MyCommentsState> {
  final Service service = getIt<Service>();

  MyCommentsCubit() : super(const InitialMyCommentsState());

  void getComments() async {
    var comments = await service.getComments(userId: Globals.loggedUserId);
    emit(LoadedMyCommentsState(comments));
  }
}

@immutable
abstract class MyCommentsState {
  const MyCommentsState();
}

class InitialMyCommentsState extends MyCommentsState {
  const InitialMyCommentsState() : super();
}

class LoadedMyCommentsState extends MyCommentsState {
  final List<Comment> comments;

  const LoadedMyCommentsState(this.comments) : super();
}
