import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'book_details_list_view_section.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(

      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child:  Column(
              children: [
                BooksDetailsSection(
                  book: bookModel,
                ),
                 Expanded(child: SizedBox(height: 50,)),
                BookDetailsListViewSection(),
              ],
            ),
          ) ,
        ),
      ],
    );
  }
}


