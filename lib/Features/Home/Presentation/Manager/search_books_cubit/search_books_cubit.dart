import 'package:bloc/bloc.dart';

import '../../../../Home/Data/Repos/home_repo_imp.dart';
import '../../../../Home/Presentation/Manager/search_books_cubit/search_books_states.dart';

class SearchBooksCubit extends Cubit<SearchBooksStates> {
  final HomeRepoImp homeRepo;

  SearchBooksCubit(this.homeRepo) : super(InitialSearchBooksState());

  // Define the searchBooks method
  Future<void> searchBooks(String query) async {
    emit(LoadingSearchBooksState());
    final result = await homeRepo.searchBooks(name: query);
    result.fold(
          (failure) => emit(FailureSearchBooksState(failure.errMessage)),
          (books) => emit(SuccessSearchBooksState(books)),
    );
  }
}
