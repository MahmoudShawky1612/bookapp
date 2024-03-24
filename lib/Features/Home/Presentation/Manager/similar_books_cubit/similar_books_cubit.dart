import 'package:bloc/bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';

import 'similar_books_states.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksStates>{
  SimilarBooksCubit(this.homeRepo) : super(InitialSimilarBooksState());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category})async{
    emit(LoadingSimilarBooksState());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) => {
      emit(FailureSimilarBooksState(failure.errMessage))
    }, (books) => {
      emit(SuccessSimilarBooksState(books))
    });
  }
}











