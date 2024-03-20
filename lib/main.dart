import 'package:flutter/material.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:flutterprojects/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Dodje());
}

class Dodje extends StatelessWidget {
  const Dodje({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
      scaffoldBackgroundColor: primaryColor,
        textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    ),
    );
  }
}
