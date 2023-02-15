import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/comment.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final Service service = getIt<Service>();

  CommentsCubit() : super(const InitialCommentsState());

  void load(String postId) async {
    var post = await service.getPost(postId);
    var comments = await service.getComments(postId: postId);
    emit(LoadedCommentsState(
      post.firstImage,
      post.title,
      post.authorName,
      post.dateGmt,
      comments,
    ));
  }

  void addComment(BuildContext context, String postId, String content) async {
    await service
        .addComment(Globals.loggedUserId, postId, content)
        .then((value) => Navigator.pop(context));
  }
}

@immutable
abstract class CommentsState {
  const CommentsState();
}

class InitialCommentsState extends CommentsState {
  const InitialCommentsState() : super();
}

class LoadedCommentsState extends CommentsState {
  final String postImage;
  final String postTitle;
  final String postAuthorName;
  final DateTime postDateGmt;
  final List<Comment> comments;

  const LoadedCommentsState(this.postImage, this.postTitle, this.postAuthorName,
      this.postDateGmt, this.comments)
      : super();
}
