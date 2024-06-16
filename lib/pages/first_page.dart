import 'package:final01/components/category_list.dart';
import 'package:final01/components/popular_list.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../components/categories_items.dart';
import '../components/screen_1.dart';
import '../components/screen_2.dart';
import '../components/screen_3.dart';
import '../components/screen_4.dart';
import '../components/search_box.dart';
import '../pages/about_us_page.dart';
import '../pages/cart_page.dart';
import '../pages/feedback_page.dart';
import '../pages/login_page.dart';
import '../pages/privacy_policy_page.dart';
import 'Home_page.dart';
import 'favourite_page.dart';
import 'settings_page.dart';
import 'shop_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  int _selectedIndex = 0;

  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    ShopPage(),
    FavoritePage(), // Remove const keyword
    SettingsPage(),
  ];
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'C   O   Z   Y',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu),
            ),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          // User account icon on the right side
          // IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   padding: const EdgeInsets.only(right: 16.0), // Adjusted padding
          //   color: Colors.white,
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const CartPage()),
          //     );
          //   },
          // ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.yellow.shade800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                DrawerHeader(
                  child: Image.asset('lib/images/logo.png'),
                ),
                // other pages
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: GestureDetector(
                    //Transition
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const AboutUsPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOutQuart;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        'AboutUs',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: GestureDetector(
                    //Transition
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const FeedbackPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOutQuart;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            var offsetAnimation = tween.animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.feedback,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Feedback',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    //Transition
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const PrivacyPolicyPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOutQuart;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            var offsetAnimation = tween.animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.privacy_tip,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage())
                ),
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
