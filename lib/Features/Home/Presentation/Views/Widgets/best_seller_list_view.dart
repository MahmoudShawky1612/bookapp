import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Core/Widgets/custom_error.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/newest_books_cubit/newest_books_states.dart';

import 'book_list_view_item.dart';

import 'package:shimmer/shimmer.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
      builder: (context, state) {
        if (state is SuccessNewestBooksState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is FailureNewestBooksState) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7, // Placeholder for shimmer effect
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.white,
                  child: Container(
                    width: double.infinity,
                    height: 100.0, // Height of each shimmer item
                    color: Colors.white, // Background color of shimmer item
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
