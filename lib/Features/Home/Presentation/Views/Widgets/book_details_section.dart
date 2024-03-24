import 'package:flutter/cupertino.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';

import '../../../../../Core/utils/styles/font_styls.dart';
import 'book_action.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return  Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(imageUrl:
            book.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(height: 43,),
         Text(book.volumeInfo.title!,style: Styles.testStyle30,textAlign: TextAlign.center,),
        const SizedBox(height: 6,),
        Opacity(
          opacity: 0.7,
          child: Text(book.volumeInfo.authors![0],style: Styles.testStyle18.copyWith(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
          ),
        ),
        const SizedBox(height: 16,),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center, rating: '23', count: 23,),
        const SizedBox(height: 20,),
         BookAction(
          bookModel: book,
        ),
      ],
    );
  }
}