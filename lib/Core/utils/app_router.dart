import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Core/utils/service_locator.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo_imp.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutterprojects/Features/Home/Presentation/Views/Widgets/home_view_body.dart';
import 'package:flutterprojects/Features/Home/Presentation/Views/book_details_view.dart';
import 'package:flutterprojects/Features/Search/Presentation/Views/search_view.dart';
import 'package:flutterprojects/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Home/Presentation/Views/home_view.dart';

abstract class AppRouter{
  static const kHomeView='/homeView';
  static const kBookDetailsView='/bookDetailsView';
  static const kSearchView='/searchView';
  static final  router = GoRouter(

    routes: [
      GoRoute(
        path: '/',
        builder: ( context,  state) =>
           const SplashView(),
      ),
          GoRoute(
            path: kHomeView,
            builder: ( context,  state)=>
               const HomeView(),

          ),GoRoute(
            path: kBookDetailsView,
            builder: ( context,  state)=> BlocProvider(
                create: (context)=>SimilarBooksCubit(
                  getIt.get<HomeRepoImp>(),
                ),
                child:  BookDetailsView(
                  bookModel: state.extra as BookModel,
                )),

          ),GoRoute(
            path: kSearchView,
            builder: ( context,  state)=>
               const SearchView(),

          ),
        ],
      );

}