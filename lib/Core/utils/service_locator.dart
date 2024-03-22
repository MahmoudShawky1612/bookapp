import 'package:dio/dio.dart';
import 'package:flutterprojects/Core/utils/api_service.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
 getIt.registerSingleton<ApiService>(ApiService(Dio()));
 getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));
}














