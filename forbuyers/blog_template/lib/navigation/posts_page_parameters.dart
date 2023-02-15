import 'package:blog_template/service/sort_by.dart';

class PostsPageParameters {
  final String? keyword;
  final String? categoryId;
  final bool onlyBookmarkeds;
  final SortBy sortBy;
  const PostsPageParameters(
      {this.keyword,
      this.categoryId,
      this.onlyBookmarkeds = false,
      this.sortBy = SortBy.unsorted});
}
