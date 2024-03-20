import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojects/Core/utils/styles/font_styls.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Home/Presentation/Views/Widgets/book_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 30),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const CustomSearchTextField(),
          const SizedBox(height: 40,),
           Text("Results",style: Styles.testStyle14.copyWith(fontWeight: FontWeight.w600),),
          const   SizedBox(height: 25,),
          Expanded(child: const SearchListView()),


        ],
      ),
    );
  }
}
class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return const Padding(
          padding:  EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    ); ;
  }
}
