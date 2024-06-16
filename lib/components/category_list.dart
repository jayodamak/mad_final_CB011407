import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List<String> categories = ['All', 'Cappuccino', 'Machiato', 'Latte', 'Americano'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: index == 0 ? 30 : 0,
              right: index == categories.length - 1 ? 30 : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Colors.white.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
