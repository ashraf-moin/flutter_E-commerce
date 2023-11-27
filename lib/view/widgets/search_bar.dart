import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  const MySearchBar({required this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Search",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          contentPadding: EdgeInsets.only(left: 16,right: 16),
          suffixIcon: Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}