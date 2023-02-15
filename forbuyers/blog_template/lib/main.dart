import 'package:blog_template/app_theme.dart';
import 'package:blog_template/bloc_providers.dart';
import 'package:blog_template/localization/locals_delegate.dart';
import 'package:blog_template/locator.dart';
import 'package:blog_template/navigation/main_routes.dart';
import 'package:blog_template/navigation/navigator_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const BlogApp()));
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.getProviders,
      child: MaterialApp(
        theme: AppTheme.greenLightTheme, // color theme for light mode
        darkTheme: AppTheme.greenDarkTheme, // color theme for dark mode
        localizationsDelegates: const [
          LocalsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          //Locale('es', ''), //To add more language support
        ],
        onGenerateRoute: MainRoutes.generate,
        navigatorKey: NavigatorKeys.main,
      ),
    );
  }
}
