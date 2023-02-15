import 'package:blog_template/model/entity.dart';

/// Type represent comment entity
class Comment extends Entity {
  /// The date of the comment
  DateTime dateGmt;

  /// Content of the comment
  String content;

  /// The id of the associated post
  String postId;

  /// The title of the associated post
  String postTitle = "";

  /// The image of the associated post
  String postImage = "";

  /// The date of the post
  DateTime postDateGmt = DateTime.utc(2000);

  /// Author name of the post
  String authorName = "";

  /// The id of the associated user
  String userId;

  /// The name of the associated user
  String userFullName = "";

  Comment(
      {required String id,
      required this.dateGmt,
      required this.content,
      required this.postId,
      required this.userId})
      : super(id: id);
}
