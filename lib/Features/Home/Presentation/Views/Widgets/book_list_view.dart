import 'package:flutter/cupertino.dart';

import 'custom_book_image.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *.23,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child:  CustomBookImage(),
            );

          }),
    );
  }
}





