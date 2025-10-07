import 'package:flutter/material.dart';
import 'package:my_marks/core/consts/theme/app_theme.dart';
import 'package:my_marks/core/routes/routes.dart';
import 'package:my_marks/features/auth/presentation/pages/sign_in_page.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SignInPage(),
onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
