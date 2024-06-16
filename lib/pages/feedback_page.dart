import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        title: const Text('F e e d b a c k'),
        centerTitle: true, // Center the title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_back),
            ),
            color: Colors.black,
            onPressed: () {
              // Scaffold.of(context).ShopPage();
              Navigator.pop(context);
            },
          ),
        ),
      ),


    );
  }

  navigateBottomBar(int index) {}
}
