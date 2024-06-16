import 'package:flutter/material.dart';
import '../components/categories_items.dart';
import '../components/category_list.dart';
import '../components/search_box.dart';
import '../pages/about_us_page.dart';
import '../pages/cart_page.dart';
import '../pages/feedback_page.dart';
import '../pages/login_page.dart';
import '../pages/privacy_policy_page.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade800,

      body: Column(
        children: [
          const SearchBox(),
          const SizedBox(height: 40,),
          const CategoryList(),
          const SizedBox(height: 40,),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[50],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                const Positioned.fill(
                  child: CategoriesItems(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
