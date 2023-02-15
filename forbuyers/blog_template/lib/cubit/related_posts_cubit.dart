import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/post.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedPostsCubit extends Cubit<RelatedPostsState> {
  final Service service = getIt<Service>();

  RelatedPostsCubit() : super(const InitialRelatedPostsState());

  void getPosts(List<String> ids) async {
    final posts =
        await service.getPosts(userId: Globals.loggedUserId, postIds: ids);

    emit(LoadedRelatedPostsState(posts));
  }
}

@immutable
abstract class RelatedPostsState {
  const RelatedPostsState();
}

class InitialRelatedPostsState extends RelatedPostsState {
  const InitialRelatedPostsState() : super();
}

class LoadedRelatedPostsState extends RelatedPostsState {
  final List<Post> relatedPosts;

  const LoadedRelatedPostsState(this.relatedPosts) : super();
}
