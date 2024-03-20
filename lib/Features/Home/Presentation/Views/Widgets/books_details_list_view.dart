import 'package:flutter/cupertino.dart';

import 'custom_book_image.dart';

class BooksDetailsListView extends StatelessWidget {
  const BooksDetailsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height *.17,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5),
              child:  CustomBookImage(),
            );

          }),
    );
  }
}
