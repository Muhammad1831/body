import 'package:body/config/theme/app_theme.dart';
import 'package:body/features/body-anatomy/presentation/page/body_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, theme: darkTheme, home: BodyPage());
  }
}
