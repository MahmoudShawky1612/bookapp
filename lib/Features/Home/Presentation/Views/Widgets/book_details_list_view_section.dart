import 'package:flutter/cupertino.dart';

import '../../../../../Core/utils/styles/font_styls.dart';
import 'books_details_list_view.dart';

class BookDetailsListViewSection extends StatelessWidget {
  const BookDetailsListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You may also like",
          style: Styles.testStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding:  EdgeInsets.only(bottom: 50.0),
          child: BooksDetailsListView(),
        ),
      ],
    );
  }
}
