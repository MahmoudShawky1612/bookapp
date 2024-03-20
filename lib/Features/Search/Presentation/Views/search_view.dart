import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(child: SearchViewBody()),
    );
  }
}












