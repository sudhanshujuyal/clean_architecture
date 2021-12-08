import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/config/themes/app_theme.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:flutter/material.dart';

Future<void> main() async
{
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,


    );
  }
}
