import 'package:bloc/bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';

import 'newest_books_states.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates>{
  NewestBooksCubit(this.homeRepo) : super(InitialNewestBooksState());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async{
    emit(LoadingNewestBooksState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) => {
      emit(FailureNewestBooksState(failure.errMessage))
    }, (books) => {
      emit(SuccessNewestBooksState(books))
    });
  }
}











