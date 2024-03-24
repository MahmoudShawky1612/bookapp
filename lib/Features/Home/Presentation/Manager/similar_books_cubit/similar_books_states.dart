import '../../../Data/Model/book_model.dart';

abstract class SimilarBooksStates{}

class InitialSimilarBooksState extends SimilarBooksStates{}
class LoadingSimilarBooksState extends SimilarBooksStates{}
class SuccessSimilarBooksState extends SimilarBooksStates{
  List<BookModel> books;
  SuccessSimilarBooksState(this.books);
}
class FailureSimilarBooksState extends SimilarBooksStates{
  final String errMessage;
  FailureSimilarBooksState(this.errMessage);
}