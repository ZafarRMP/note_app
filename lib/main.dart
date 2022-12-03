import 'package:ProNote/domain/hive/hive_keys.dart';
import 'package:ProNote/domain/hive/note_data.dart';
import 'package:ProNote/ui/app.dart';
import 'package:ProNote/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryBgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  // Инициализация приложения
  await Hive.initFlutter();
  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>(HiveKeys.notesKey);
  // HiveBoxes.notes.clear();
  runApp(const NoteApp());
}
