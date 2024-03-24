import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:flutterprojects/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Core/utils/service_locator.dart';
import 'Features/Home/Data/Repos/home_repo_imp.dart';
import 'Features/Home/Presentation/Manager/featured_books_cubit/featured_books_cubit.dart';
import 'Features/Home/Presentation/Manager/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const Dodje());
}

class Dodje extends StatelessWidget {
  const Dodje({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) =>FeaturedBooksCubit(getIt.get<HomeRepoImp>())..fetchFeaturedBooks()),

      BlocProvider(
    create: (context) =>NewestBooksCubit(getIt.get<HomeRepoImp>())..fetchNewestBooks()),

    ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryColor,
          textTheme:GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      ),
    );
  }
}
