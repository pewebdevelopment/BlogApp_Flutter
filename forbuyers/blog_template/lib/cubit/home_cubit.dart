import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/post.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final Service service = getIt<Service>();

  HomeCubit() : super(const LoadingHomeState());

  void getPosts() async {
    emit(const LoadingHomeState());

    service.getPosts(userId: Globals.loggedUserId).then(
      (posts) {
        emit(
          LoadedHomeState(
            firstPost: posts[0],
            secondPost: posts[1],
            thirdPost: posts[2],
            posts: posts.skip(3).toList(),
          ),
        );
      },
    );
  }
}

@immutable
abstract class HomeState {
  const HomeState();
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState() : super();
}

class LoadedHomeState extends HomeState {
  final Post firstPost;
  final Post secondPost;
  final Post thirdPost;
  final List<Post> posts;

  const LoadedHomeState(
      {required this.firstPost,
      required this.secondPost,
      required this.thirdPost,
      required this.posts})
      : super();
}
