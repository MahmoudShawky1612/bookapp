import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Core/Widgets/custom_error.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/similar_books_cubit/similar_books_states.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/app_router.dart';
import 'custom_book_image.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (BuildContext context, SimilarBooksStates state) {
        if (state is SuccessSimilarBooksState) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .17,
            child: ListView.builder(
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,),
                    ),
                  );
                }),
          );
        } else if (state is FailureSimilarBooksState) {
          return CustomError(errMessage: state.errMessage);
        }
        else
          return CircularProgressIndicator();
      },
    );
  }



}
