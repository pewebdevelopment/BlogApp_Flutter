import 'package:blog_template/navigation/photo_browser_page_parameters.dart';
import 'package:blog_template/navigation/posts_page_parameters.dart';
import 'package:blog_template/page/account_details_page.dart';
import 'package:blog_template/page/change_password_page.dart';
import 'package:blog_template/page/comments_page.dart';
import 'package:blog_template/page/my_account_page.dart';
import 'package:blog_template/page/my_comments_page.dart';
import 'package:blog_template/page/photo_browser_page.dart';
import 'package:blog_template/page/post_detail_page.dart';
import 'package:blog_template/page/posts_page.dart';
import 'package:flutter/material.dart';

class AccountTabRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MyAccountPage());
      case "/changepassword":
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordPage());
      case "/accountdetails":
        return MaterialPageRoute(
            builder: (context) => const AccountDetailsPage());
      case "/mycomments":
        return MaterialPageRoute(builder: (context) => const MyCommentsPage());
      case "/postdetail":
        return MaterialPageRoute(
          builder: (context) {
            final postId = settings.arguments as String;
            return PostDetailPage(postId);
          },
        );
      case "/bookmarks":
        return MaterialPageRoute(
          builder: (context) {
            final params = settings.arguments as PostsPageParameters;
            return PostsPage(params.keyword, params.categoryId,
                params.onlyBookmarkeds, params.sortBy);
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
        return MaterialPageRoute(builder: (context) => const MyAccountPage());
    }
  }
}
