import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/post.dart';
import 'package:blog_template/service/service.dart';
import 'package:blog_template/service/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  final Service service = getIt<Service>();

  PostsCubit() : super(const InitialPostsState());

  void getPosts(String? keyword, String? categoryId, bool onlyBookmarkeds,
      SortBy sortBy) async {
    final posts = await service.getPosts(
        categoryId: categoryId,
        keyword: keyword,
        userId: Globals.loggedUserId,
        onlyBookmarkeds: onlyBookmarkeds,
        sortBy: sortBy);
    emit(LoadedPostsState(posts: posts));
  }
}

@immutable
abstract class PostsState {
  const PostsState();
}

class InitialPostsState extends PostsState {
  const InitialPostsState() : super();
}

class LoadedPostsState extends PostsState {
  final List<Post> posts;

  const LoadedPostsState({required this.posts}) : super();
}
