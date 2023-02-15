import 'package:blog_template/navigation/photo_browser_page_parameters.dart';
import 'package:blog_template/navigation/posts_page_parameters.dart';
import 'package:blog_template/page/comments_page.dart';
import 'package:blog_template/page/home_page.dart';
import 'package:blog_template/page/photo_browser_page.dart';
import 'package:blog_template/page/post_detail_page.dart';
import 'package:blog_template/page/posts_page.dart';
import 'package:blog_template/page/search_page.dart';
import 'package:flutter/material.dart';

class HomeTabRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/search":
        return MaterialPageRoute(builder: (context) => const SearchPage());
      case "/posts":
        return MaterialPageRoute(
          builder: (context) {
            final params = settings.arguments as PostsPageParameters;
            return PostsPage(params.keyword, params.categoryId,
                params.onlyBookmarkeds, params.sortBy);
          },
        );
      case "/postdetail":
        return MaterialPageRoute(
          builder: (context) {
            final postId = settings.arguments as String;
            return PostDetailPage(postId);
          },
        );
      case "/comments":
        return MaterialPageRoute(
          builder: (context) {
            final postId = settings.arguments as String;
            return CommentsPage(postId);
          },
        );
      case "/photobrowser":
        return MaterialPageRoute(
          builder: (context) {
            final params = settings.arguments as PhotoBrowserPageParameters;
            return PhotoBrowserPage(params.initialImage, params.images);
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
