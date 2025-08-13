import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_taking_app_with_offline_sync/myapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note-Taking App",
      initialRoute: AppRoutes.notes,
      getPages: AppPages.pages,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
        ),
        cardColor: Colors.grey[800],
      ),
      themeMode: ThemeMode.system,
    );
  }
}
