import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/Core/utils/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets.dart';
import '../../../../../Core/utils/styles/font_styls.dart';
import '../../../../../constants.dart';
import 'book_rating.dart';


class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [

            AspectRatio(
              aspectRatio:1.2/1.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.red,
                  image:const DecorationImage(
                    image: AssetImage(AssetsData.test),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width *.5,
                    child:  Text("The Last Four Things",
                      style: Styles.testStyle20.copyWith(fontFamily: KGtSecraFine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  const  Text("Paul Hoffman",style: Styles.testStyle14,),

                  const SizedBox(height: 3,),


                  Row(
                    children: [
                      Text("19.99 %",style: Styles.testStyle20.copyWith(fontWeight: FontWeight.bold),),
                      Spacer(),
                      BookRating(),
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

