import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterprojects/Core/Errors/failures.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';

// Define the states
abstract class SearchBooksStates {}

class LoadingSearchBooksState extends SearchBooksStates {}
class InitialSearchBooksState extends SearchBooksStates {}

class SuccessSearchBooksState extends SearchBooksStates {
  final List<BookModel> books;

  SuccessSearchBooksState(this.books);
}

class FailureSearchBooksState extends SearchBooksStates {
  final String errorMessage;

  FailureSearchBooksState(this.errorMessage);
}

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  final HomeRepo homeRepo;

  SearchBooksCubit(this.homeRepo) : super(LoadingSearchBooksState());

  // Define the searchBooks method
  void searchBooks(String query) async {
    emit(LoadingSearchBooksState());
    final result = await homeRepo.searchBooks(name: query);
    result.fold(
          (failure) => emit(FailureSearchBooksState(failure.errMessage)),
          (books) => emit(SuccessSearchBooksState(books)),
    );
  }
}
