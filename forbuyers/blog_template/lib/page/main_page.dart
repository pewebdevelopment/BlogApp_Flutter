import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/navigation/account_tab_routes.dart';
import 'package:blog_template/navigation/home_tab_routes.dart';
import 'package:blog_template/navigation/navigator_keys.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;

  static final List<Widget> _tabPages = <Widget>[
    Navigator(
        key: NavigatorKeys.homeTab,
        initialRoute: "/",
        onGenerateRoute: HomeTabRoutes.generate),
    Navigator(
        key: NavigatorKeys.accountTab,
        initialRoute: "/",
        onGenerateRoute: AccountTabRoutes.generate),
  ];

  void _tabTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locals = Locals.of(context);

    return Scaffold(
      body: _tabPages.elementAt(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: locals.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: locals.myAccount,
          ),
        ],
        currentIndex: _tabIndex,
        onTap: _tabTapped,
      ),
    );
  }
}
