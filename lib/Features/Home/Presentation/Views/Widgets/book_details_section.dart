import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/styles/font_styls.dart';
import 'book_action.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return  Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 43,),
        const Text("The Last Four Things",style: Styles.testStyle30,),
        const SizedBox(height: 6,),
        Opacity(
          opacity: 0.7,
          child: Text("Paul Hoffman",style: Styles.testStyle18.copyWith(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
          ),
        ),
        const SizedBox(height: 16,),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center,),
        const SizedBox(height: 20,),
        const BookAction(),
      ],
    );
  }
}