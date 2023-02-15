import 'package:blog_template/datastore/data_store.dart';
import 'package:blog_template/datastore/mock/bookmark_data_store.dart';
import 'package:blog_template/datastore/mock/category_data_store.dart';
import 'package:blog_template/datastore/mock/comment_data_store.dart';
import 'package:blog_template/datastore/mock/keyword_data_store.dart';
import 'package:blog_template/datastore/mock/post_data_store.dart';
import 'package:blog_template/datastore/mock/user_data_store.dart';
import 'package:blog_template/globals.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/model/bookmark.dart';
import 'package:blog_template/model/category.dart';
import 'package:blog_template/model/comment.dart';
import 'package:blog_template/model/keyword.dart';
import 'package:blog_template/model/post.dart';
import 'package:blog_template/model/user.dart';
import 'package:blog_template/service/sort_by.dart';
import 'package:uuid/uuid.dart';

///Mock service that works with mock data stores for testing.
class Service {
  DataStore<Category> dataCategory = getIt<CategoryDataStore>();
  DataStore<Comment> dataComment = getIt<CommentDataStore>();
  DataStore<Bookmark> dataBookmark = getIt<BookmarkDataStore>();
  DataStore<Post> dataPost = getIt<PostDataStore>();
  DataStore<User> dataUser = getIt<UserDataStore>();
  DataStore<Keyword> dataKeyword = getIt<KeywordDataStore>();

  // Methods for Comment entity

  Future<Comment> addComment(
      String userId, String postId, String content) async {
    final comment = Comment(
        id: const Uuid().v4(),
        dateGmt: DateTime.now().toUtc(),
        content: content,
        postId: postId,
        userId: userId);
    return await dataComment.add(comment);
  }

  Future<List<Comment>> getComments({String? postId, String? userId}) async {
    final results = await dataComment.getBy((c) =>
        (postId == null || c.postId == postId) &&
        (userId == null || c.userId == userId));

    for (var comment in results) {
      final user = await dataUser.get(comment.userId);
      comment.userFullName = user.fullName;

      final post = await dataPost.get(comment.postId);
      comment.postTitle = post.title;
      comment.postImage = post.firstImage;
      comment.postDateGmt = post.dateGmt;

      final author = await dataUser.get(post.authorId);
      comment.authorName = author.fullName;
    }

    var comments = results.toList();

    comments
        .sort((a, b) => b.dateGmt.compareTo(a.dateGmt)); //sort by new to old

    return comments;
  }

  Future<int> getCommentCount(String postId) async {
    return (await dataComment.getBy((c) => c.postId == postId)).length;
  }

  // Methods for Bookmark entity

  Future<Bookmark?> getBookmark(String userId, String postId) async {
    final bookmarks = await dataBookmark
        .getBy((f) => f.userId == userId && f.postId == postId);
    return bookmarks.isNotEmpty ? bookmarks.first : null;
  }

  Future<Bookmark> addBookmark(String userId, String postId) async {
    final bookmark = Bookmark(
      id: const Uuid().v4(),
      userId: userId,
      postId: postId,
    );
    return await dataBookmark.add(bookmark);
  }

  Future<bool> deleteBookmark(String id) async {
    return await dataBookmark.delete(id);
  }

  // Methods for Tag entity

  Future<List<String>> getAllTags() async {
    final posts = await dataPost.getAll();
    return posts.expand((p) => p.tags).toSet().toList();
  }

  // Methods for Keyword entity

  Future<Keyword> addKeyword(String key) async {
    final keyword = Keyword(id: const Uuid().v4(), keyword: key.toLowerCase());
    return await dataKeyword.add(keyword);
  }

  Future<List<Keyword>> getKeywords() async {
    final keywords = await dataKeyword.getAll();
    keywords.sort((a, b) => b.dateGmt.compareTo(a.dateGmt));
    return keywords;
  }

  Future<bool> deleteKeyword(String id) async {
    return await dataKeyword.delete(id);
  }

  Future<Keyword?> findKeyword(String keyword) async {
    keyword = keyword.toLowerCase();

    final keywords = await dataKeyword.getAll();
    final result = keywords.where((i) => i.keyword == keyword);
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  // Methods for Category entity

  Future<List<Category>> getCategories({String? name}) async {
    final result =
        await dataCategory.getBy((c) => name == null || c.name.contains(name));
    return result.toList();
  }

  // Methods for Post entity

  Future<Post> getPost(String id) async {
    var post = await dataPost.get(id);

    var comments = await dataComment.getBy((c) => c.postId == post.id);
    post.commentsCount = comments.length;

    var bookmarks = await dataBookmark.getBy((b) => b.postId == post.id);
    post.bookmarksCount = bookmarks.length;

    post.isBookmarked = await dataBookmark.isExist(
        (b) => b.postId == post.id && b.userId == Globals.loggedUserId);

    var author = await dataUser.get(post.authorId);
    post.authorName = author.fullName;

    return post;
  }

  Future<List<Post>> getPosts(
      {required String userId,
      String? categoryId,
      List<String>? tags,
      List<String>? postIds,
      String? keyword,
      bool onlyBookmarkeds = false,
      SortBy sortBy = SortBy.unsorted}) async {
    var result = await dataPost.getBy((p) =>
        (categoryId == null || p.categoryIds.any((id) => categoryId == id)) &&
        (tags == null || p.tags.any((t) => t.contains(t))) &&
        (postIds == null || postIds.contains(p.id)) &&
        (keyword == null ||
            p.title.toLowerCase().contains(keyword.toLowerCase())));

    for (var post in result) {
      var comments = await dataComment.getBy((c) => c.postId == post.id);
      post.commentsCount = comments.length;

      var bookmarks = await dataBookmark.getBy((b) => b.postId == post.id);
      post.bookmarksCount = bookmarks.length;

      post.isBookmarked = await dataBookmark
          .isExist((b) => b.postId == post.id && b.userId == userId);

      var author = await dataUser.get(post.authorId);
      post.authorName = author.fullName;
    }

    var posts = result
        .where((p) => onlyBookmarkeds == false || p.isBookmarked)
        .toList();

    switch (sortBy) {
      case SortBy.newToOld:
        posts.sort((a, b) => b.dateGmt.compareTo(a.dateGmt));
        break;
      case SortBy.oldToNew:
        posts.sort((a, b) => a.dateGmt.compareTo(b.dateGmt));
        break;
      case SortBy.mostCommented:
        posts.sort((a, b) => b.commentsCount - a.commentsCount);
        break;
      case SortBy.mostBookmarked:
        posts.sort((a, b) => b.bookmarksCount - a.bookmarksCount);
        break;
      case SortBy.unsorted:
        break;
    }

    return posts;
  }

  // Method for User entity

  Future<User> getUser(String id) async {
    return await dataUser.get(id);
  }

  Future<bool> updateUser(User user) async {
    return await dataUser.update(user);
  }
}
