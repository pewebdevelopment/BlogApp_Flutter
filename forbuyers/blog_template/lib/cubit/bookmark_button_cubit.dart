import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkButtonCubit extends Cubit<IconData> {
  final Service service = getIt<Service>();

  BookmarkButtonCubit() : super(Icons.bookmark);

  void get(String postId) async {
    final bookmark = await service.getBookmark(Globals.loggedUserId, postId);

    if (bookmark != null) {
      emit(Icons.bookmark);
    } else {
      emit(Icons.bookmark_outline);
    }
  }

  void toggle(String postId) async {
    final bookmark = await service.getBookmark(Globals.loggedUserId, postId);

    if (bookmark != null) {
      await service.deleteBookmark(bookmark.id);
      emit(Icons.bookmark_outline);
    } else {
      await service.addBookmark(Globals.loggedUserId, postId);
      emit(Icons.bookmark);
    }
  }
}
