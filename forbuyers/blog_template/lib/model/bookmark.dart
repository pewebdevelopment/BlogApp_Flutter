import 'package:blog_template/model/entity.dart';

/// Type represent favorite entity
class Bookmark extends Entity {
  /// The id of the associated user
  String userId;

  /// The id of the associated post
  String postId;

  Bookmark({required String id, required this.userId, required this.postId})
      : super(id: id);
}
