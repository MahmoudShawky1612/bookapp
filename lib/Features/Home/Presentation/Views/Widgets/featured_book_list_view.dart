import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Core/Widgets/custom_error.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/featured_books_cubit/featured_books_states.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/utils/app_router.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is SuccessFeaturedBooksState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .23,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FailureFeaturedBooksState) {
          return CustomError(errMessage: state.errMessage);
        } else {
          // Placeholder for shimmer effect
          return SizedBox(
            height: MediaQuery.of(context).size.height * .23,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Number of shimmer items
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 100, // Width of each shimmer item
                      color: Colors.white, // Background color of shimmer item
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
