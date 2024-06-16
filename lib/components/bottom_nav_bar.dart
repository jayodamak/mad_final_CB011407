import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange; // Declare onTabChange as a final field
  const MyBottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[800],
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GNav(
        color: Colors.black,
        activeColor: Colors.yellow[800],
        tabActiveBorder: Border.all(color: Colors.yellow.shade50),
        tabBackgroundColor: Colors.yellow.shade50,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: ' Home',
          ),
          GButton(
            icon: Icons.category,
            text: ' Categories',
          ),
          GButton(
            icon: Icons.favorite,
            text: ' Favourite',
          ),
          GButton(
            icon: Icons.account_circle,
            text: ' Profile',
          ),
        ],
      ),
    );
  }
}
