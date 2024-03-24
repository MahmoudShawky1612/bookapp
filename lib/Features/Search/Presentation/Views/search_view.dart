import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo_imp.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/search_books_cubit/search_books_cubit.dart';

import '../../../../Core/utils/api_service.dart';
import 'Widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an instance of ApiService
    final apiService = ApiService(Dio()); // You need to provide Dio instance or whatever is appropriate

    // Provide the SearchBooksCubit above the SearchViewBody
    return BlocProvider(
      create: (context) => SearchBooksCubit(HomeRepoImp(apiService)), // Provide the appropriate repository
      child: Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
