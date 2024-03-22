import 'package:dartz/dartz.dart';
import 'package:flutterprojects/Core/Errors/failures.dart';

import '../Model/book_model.dart';

abstract class HomeRepo{
  Future<Either<Failures,List<BookModel>>>fetchNewestBooks();
  Future<Either<Failures,List<BookModel>>>fetchFeaturedBooks();
}