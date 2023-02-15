import 'package:blog_template/model/entity.dart';

/// Type represent post entity
class Post extends Entity {
  /// The date of the post
  DateTime dateGmt;

  /// Title for the post
  String title;

  /// Content for the post
  String content;

  /// Author id of the post
  String authorId;

  /// Author name of the post
  String authorName = "";

  /// List of ids of associated categories
  List<String> categoryIds;

  /// List of associated tags
  List<String> tags;

  /// List of images
  List<String> images;

  /// List of ids of related posts
  List<String> relatedIds;

  /// Number of comments
  int commentsCount = 0;

  /// Number of users who added it to favorites
  int bookmarksCount = 0;

  /// True if it is bookmared item for the logged customer
  bool isBookmarked = false;

  /// Get the first image of the post
  String get firstImage {
    return images.isNotEmpty ? images[0] : "no_image";
  }

  Post({
    required String id,
    required this.dateGmt,
    required this.title,
    required this.content,
    required this.authorId,
    required this.categoryIds,
    required this.tags,
    required this.images,
    required this.relatedIds,
  }) : super(id: id);
}
