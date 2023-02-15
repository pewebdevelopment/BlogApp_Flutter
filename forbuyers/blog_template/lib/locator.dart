import 'package:blog_template/datastore/mock/bookmark_data_store.dart';
import 'package:blog_template/datastore/mock/category_data_store.dart';
import 'package:blog_template/datastore/mock/comment_data_store.dart';
import 'package:blog_template/datastore/mock/keyword_data_store.dart';
import 'package:blog_template/datastore/mock/post_data_store.dart';
import 'package:blog_template/datastore/mock/user_data_store.dart';
import 'package:blog_template/service/service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<BookmarkDataStore>(BookmarkDataStore());
  getIt.registerSingleton<CategoryDataStore>(CategoryDataStore());
  getIt.registerSingleton<CommentDataStore>(CommentDataStore());
  getIt.registerSingleton<PostDataStore>(PostDataStore());
  getIt.registerSingleton<UserDataStore>(UserDataStore());
  getIt.registerSingleton<KeywordDataStore>(KeywordDataStore());

  getIt.registerFactory(() => Service());
}
