import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutterprojects/Core/Errors/failures.dart';
import 'package:flutterprojects/Core/utils/api_service.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';

class HomeRepoImp implements HomeRepo{
   final ApiService apiService;
   HomeRepoImp(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get( endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      List<BookModel> books=[];
      for(var item in data['items'])
        {
          books.add(BookModel.fromJson(item));

        }
      return right(books);
    } catch (e) {
      if(e is DioException)
        {
          return left(ServerFailure.fromDioException(e));
        }
      return left(ServerFailure(e.toString()));
    }


  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get( endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));

      }
      return right(books);
    } catch (e) {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }


  }
}