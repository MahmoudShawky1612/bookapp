import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/similar_books_cubit/similar_books_states.dart';
import 'package:flutterprojects/Features/Home/Presentation/Views/Widgets/book_details_view_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState(){
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo.categories![0],
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(body: BookDetailsViewBody(
      bookModel: widget.bookModel,
    ),));
  }
}
