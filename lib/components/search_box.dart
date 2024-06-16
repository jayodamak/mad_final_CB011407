import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4 ,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),

      child: const TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(Icons.search,
              color: Colors.white60,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.white60,
            )
        ),
      ),
    );

  }
}
