import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'book_details_list_view_section.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(

      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30),
            child:  Column(
              children: [
                BooksDetailsSection(),
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


