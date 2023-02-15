import 'package:blog_template/page/login_page.dart';
import 'package:blog_template/page/main_page.dart';
import 'package:blog_template/page/reset_password_page.dart';
import 'package:blog_template/page/sign_up_page.dart';
import 'package:flutter/material.dart';

class MainRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const MainPage());
      case "/login":
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case "/login/resetpassword":
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordPage());
      case "/login/signup":
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      default:
        return MaterialPageRoute(builder: (context) => const MainPage());
    }
  }
}
