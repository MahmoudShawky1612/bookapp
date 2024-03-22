import '../../../Data/Model/book_model.dart';

abstract class FeaturedBooksStates{}

class InitialFeaturedBooksState extends FeaturedBooksStates{}
class LoadingFeaturedBooksState extends FeaturedBooksStates{}
class SuccessFeaturedBooksState extends FeaturedBooksStates{
  List<BookModel> books;
  SuccessFeaturedBooksState(this.books);
}
class FailureFeaturedBooksState extends FeaturedBooksStates{
   final String errMessage;
  FailureFeaturedBooksState(this.errMessage);
}