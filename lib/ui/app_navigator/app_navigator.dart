import 'package:ProNote/ui/app_navigator/app_routes.dart';
import 'package:ProNote/ui/pages/add_note_page/add_note_page.dart';
import 'package:ProNote/ui/pages/change_page/change_page.dart';
import 'package:ProNote/ui/pages/home_page/home_page.dart';
import 'package:ProNote/ui/pages/search_page/search_page.dart';
import 'package:flutter/cupertino.dart';

class AppNavigator {
  static String get initialRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
        AppRoutes.addNotePage: (context) => const AddNotePage(),
        AppRoutes.changePage: (context) => const ChangePage(),
      };
}
