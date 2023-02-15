import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/comment.dart';
import 'package:blog_template/model/post.dart';
import 'package:blog_template/navigation/photo_browser_page_parameters.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  final Service service = getIt<Service>();

  PostDetailCubit() : super(const InitialPostDetailState());

  void getPost(String postId) async {
    final post = await service.getPost(postId);
    final comments = await service.getComments(postId: postId);
    final relatedPosts = await service.getPosts(
        userId: Globals.loggedUserId, postIds: post.relatedIds);

    emit(LoadedPostDetailState(post, comments.first, relatedPosts));
  }

  void bookmark() async {
    final loadedState = state as LoadedPostDetailState;

    final bookmark =
        await service.getBookmark(Globals.loggedUserId, loadedState.postId);

    if (bookmark != null) {
      await service.deleteBookmark(bookmark.id);
    } else {
      await service.addBookmark(Globals.loggedUserId, loadedState.postId);
    }

    final post = await service.getPost(loadedState.postId);
    final comments = await service.getComments(postId: loadedState.postId);
    final relatedPosts = await service.getPosts(
        userId: Globals.loggedUserId, postIds: post.relatedIds);

    emit(LoadedPostDetailState(post, comments.first, relatedPosts));
  }

  void showComments(BuildContext context, String postId) {
    Navigator.of(context).pushNamed("/comments", arguments: postId).then((_) => getPost(postId));
  }

  void photoBrowser(BuildContext context, String initialImage) {
    final loadedState = state as LoadedPostDetailState;

    final params = PhotoBrowserPageParameters(
        initialImage: initialImage, images: loadedState.postImages);
    Navigator.of(context).pushNamed("/photobrowser", arguments: params);
  }
}

@immutable
abstract class PostDetailState {
  const PostDetailState();
}

class InitialPostDetailState extends PostDetailState {
  const InitialPostDetailState() : super();
}

class LoadedPostDetailState extends PostDetailState {
  final Post _post;
  final Comment comment;
  final List<Post> relatedPosts;

  String get postId => _post.id;
  String get postTitle => _post.title;
  DateTime get postDateGmt => _post.dateGmt;
  String get postContent => _post.content;
  String get postAuthorName => _post.authorName;
  List<String> get postImages => _post.images;
  int get postCommentsCount => _post.commentsCount;
  int get postBookmarksCount => _post.bookmarksCount;
  bool get postIsBookmarked => _post.isBookmarked;
  List<String> get postRelatedIds => _post.relatedIds;
  IconData get postBookmarkIcon =>
      _post.isBookmarked ? Icons.bookmark : Icons.bookmark_outline;

  const LoadedPostDetailState(this._post, this.comment, this.relatedPosts)
      : super();
}
