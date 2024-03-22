import 'package:bloc/bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Repos/home_repo.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/featured_books_cubit/featured_books_states.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.homeRepo) : super(InitialFeaturedBooksState());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks()async{
    emit(LoadingFeaturedBooksState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) => {
      emit(FailureFeaturedBooksState(failure.errMessage))
    }, (books) => {
      emit(SuccessFeaturedBooksState(books))
        });
  }
}











