import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'pages/auth_page.dart';
import 'pages/cart_page.dart';
import 'pages/favourite_page.dart';
import 'pages/first_page.dart';
import 'pages/item_detail.dart';
import 'pages/edit_account.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/settings_page.dart';
import 'pages/shop_page.dart';
import 'theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth', // Set the initial route
      routes: {
        '/auth': (context) => const AuthPage(), // Authentication page
        '/': (context) =>  const FirstPage(), // First page
        '/home': (context) =>  HomePage(), // Home page
        // '/login': (context) =>  LoginPage(), // Login page
        '/cart': (context) => const CartPage(), // Cart page
        '/settings': (context) => const SettingsPage(), // Settings page
        '/shop': (context) =>  ShopPage(), // Shop page
        // '/detail': (context) =>  ItemDetail(), //Item Detail page
        '/favourite': (context) =>  FavoritePage(), //Item Detail page
      },
    );
  }
}

