import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/forward_button.dart';
import '../components/settings_item.dart';
import '../components/dark_mode_switch.dart';
import 'about_us_page.dart';
import 'cart_page.dart';
import 'edit_account.dart';
import 'feedback_page.dart';
import 'login_page.dart';
import 'privacy_policy_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String fullName = "Loading...";
  String phone = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            fullName = userDoc['fullName'] ?? 'No name';
            phone = userDoc['phone'] ?? 'No phone number';
          });
        } else {
          setState(() {
            fullName = "No name found";
            phone = "No phone number found";
          });
        }
      } else {
        setState(() {
          fullName = "No user logged in";
          phone = "No user logged in";
        });
      }
    } catch (e) {
      setState(() {
        fullName = "Failed to load";
        phone = "Failed to load";
      });
      print("Failed to fetch user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.yellow[50],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/images/user.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            phone,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ForwardButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditAccountPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                SettingSItem(
                  title: "Language",
                  titleColor: isDarkMode ? Colors.white : Colors.black,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  icon: Icons.language,
                  value: "English",
                  onTap: () { },
                  isDarkMode: isDarkMode,
                ),
                const SizedBox(height: 20),
                SettingSItem(
                  title: "Notifications",
                  titleColor: isDarkMode ? Colors.white : Colors.black,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  icon: Icons.notifications,
                  onTap: () { },
                  isDarkMode: isDarkMode,
                ),
                const SizedBox(height: 20),
                DarkModeSwitch(
                  title: "Dark Mode",
                  titleColor: isDarkMode ? Colors.white : Colors.black,
                  bgColor: isDarkMode ? Colors.grey[700]! : Colors.yellow.shade600,
                  iconColor: isDarkMode ? Colors.white : Colors.black,
                  icon: Icons.lightbulb_outline,
                  value: isDarkMode,
                  onTap: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SettingSItem(
                  title: "Help",
                  titleColor: isDarkMode ? Colors.white : Colors.black,
                  bgColor: Colors.red.shade100,
                  iconColor: Colors.red,
                  icon: Icons.help,
                  onTap: () { },
                  isDarkMode: isDarkMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
