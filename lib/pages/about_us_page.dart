import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        title: const Text('About Us'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_back),
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Builder(
        builder: (context) => const SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Welcome to "Cozy"',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      'Why Cozy?',
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                      'Life\'s most beautiful moments unfold in the coziest of places.'
                          ' Whether you\'re catching up with an old friend, delving into'
                          ' a good book, or relishing a moment of solitude, "Cozy" is '
                          'your sanctuary. Each bean we brew is selected with care, and '
                          'every cup is infused with an extra touch of coziness.'
                          'Why Cozy?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                      'At "Cozy," we don\'t just serve coffee; we curate an '
                          'environment where friends are made, and memories are '
                          'cherished. Join us in celebrating the art of slowing '
                          'down, embracing simplicity, and finding joy in the '
                          'little things. "Cozy" is an invitation to experience '
                          'life\'s beautiful moments, one sip at a time.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                      'Thank you for being part of our cozy community.'
                          ' Here\'s to warmth, connection, and the perfect'
                          ' cup of coffee!',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                      'With love and gratitude, \nThe Cozy Team 🌿',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
