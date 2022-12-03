import 'package:ProNote/domain/providers/note_provider.dart';
import 'package:ProNote/ui/app_navigator/app_navigator.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.secondaryDarkColor,
            ),
            toolbarHeight: 64,
          ),
          useMaterial3: true,
        ),
        routes: AppNavigator.routes,
        initialRoute: AppNavigator.initialRoute,
      ),
    );
  }
}
