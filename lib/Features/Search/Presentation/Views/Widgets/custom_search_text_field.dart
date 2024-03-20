import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon:  Opacity(
            opacity: 0.8,
            child: IconButton(
                onPressed: (){},
                icon:const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 17,
                )),
          )),
    );

  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide:const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
