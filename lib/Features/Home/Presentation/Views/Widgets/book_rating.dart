import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/styles/font_styls.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRating({super.key,this.mainAxisAlignment=MainAxisAlignment.start, required this.rating, required this.count});

  @override
  final String? rating;
  final int? count;
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),size: 15,),
        const SizedBox(width: 6.3,),
         Text('0',style: Styles.testStyle16,),
        const SizedBox(width: 5,),
        Opacity(
            opacity: .5,
            child: Text("(0)",style: Styles.testStyle14.copyWith(fontWeight: FontWeight.w600))),
      ],
    );
  }
}

