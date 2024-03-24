import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController? controller; // Define controller as nullable
  final ValueChanged<String>? onChanged;

  const CustomSearchTextField({
    Key? key,
    this.controller, // Update controller to be nullable
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
