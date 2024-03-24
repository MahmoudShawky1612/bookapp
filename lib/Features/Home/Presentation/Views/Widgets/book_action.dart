import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:  Row(
        children:[
          CustomButton(
            text: 'Free',
            textColor: Colors.black,
            backgroungColor: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
          ),
          CustomButton(
            text: getText(bookModel),
            fontSize: 16,
            textColor: Colors.white,
            backgroungColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
            onPressed: ()async{
              Uri uri=Uri.parse(bookModel.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
              }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Cannot launch $uri"),
                  )); 
                }
            },
          ),
        ],
      ),
    );
  }

  getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink==null)
      {
        return "Not Available";
      }
    else
      return "Preview";
  }
}
