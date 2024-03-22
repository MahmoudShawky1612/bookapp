import '../../../Data/Model/book_model.dart';

abstract class NewestBooksStates{}

class InitialNewestBooksState extends NewestBooksStates{}
class LoadingNewestBooksState extends NewestBooksStates{}
class SuccessNewestBooksState extends NewestBooksStates{
  List<BookModel> books;
  SuccessNewestBooksState(this.books);
}
class FailureNewestBooksState extends NewestBooksStates{
  final String errMessage;
  FailureNewestBooksState(this.errMessage);
}