import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Presentation/Views/Widgets/custom_book_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets.dart';
import '../../../../../Core/utils/styles/font_styls.dart';
import '../../../../../constants.dart';
import 'book_rating.dart';


class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [

            CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks.thumbnail),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width *.5,
                    child:  Text(bookModel.volumeInfo.title!,
                      style: Styles.testStyle20.copyWith(fontFamily: KGtSecraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3,),
                    Text(bookModel.volumeInfo.authors![0],style: Styles.testStyle14,),

                  const SizedBox(height: 3,),


                  Row(
                    children: [
                      Text("Free",style: Styles.testStyle20.copyWith(fontWeight: FontWeight.bold),),
                      Spacer(),
                      BookRating(
                        rating:bookModel.volumeInfo.maturityRating,
                        count: bookModel.volumeInfo.pageCount,

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

