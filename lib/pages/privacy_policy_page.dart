import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        title: const Text('P r i v a c y   P o l i c y'),
        centerTitle: true, // Center the title
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Privacy Policy for "Cozy" Coffee App',
                      style: TextStyle(fontSize: 20),
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
                        'Last Updated: [1/29/2024]',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Welcome to "Cozy," your go-to destination for a warm '
                            'coffee experience. This Privacy Policy is here to '
                            'inform you about how we collect, use, disclose, and '
                            'protect your personal information when you use our app.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        'Information We Collect',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 5),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'When you use the "Cozy" app, we may collect the '
                            'following types of information:',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Personal Information: This includes, but is not'
                            ' limited to, your name, email address, and other'
                            ' information you provide when creating an account.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Usage Information: We may collect information about how'
                            ' you use the app, including the pages you visit, '
                            'the features you use, and the actions you take.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'How We Use Your Information \n'
                            'We use the collected information for various'
                            ' purposes, including:',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Providing Services: To deliver the services you request,'
                            ' such as processing your orders and enhancing your '
                            'overall app experience.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Communication: To send you relevant information about '
                            'promotions, events, and updates related to "Cozy."',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Improvement: To analyze app usage and performance, '
                            'allowing us to enhance and optimize our services.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Data Security: We take the security of your information'
                            ' seriously. We implement industry-standard measures '
                            'to protect your personal data from unauthorized '
                            'access, disclosure, alteration, and destruction.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Sharing Your Information: We do not sell, trade, or '
                            'otherwise transfer your personal information to '
                            'third parties without your consent. However, we may'
                            ' share your information with trusted third parties'
                            ' who assist us in operating our app or servicing you,'
                            ' provided they agree to keep this information '
                            'confidential.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Changes to This Privacy Policy: We reserve the right '
                            'to update our Privacy Policy to reflect changes '
                            'in our practices or for other operational, legal,'
                            ' or regulatory reasons. Any changes will be '
                            'effective immediately upon posting the updated '
                            'Privacy Policy on the app.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'Contact Us: If you have any questions or concerns about '
                            'our Privacy Policy, please contact us at '
                            '[contact@cozycoffeeapp.com].',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        'By using the "Cozy" app, you agree to the terms '
                            'outlined in this Privacy Policy.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: Text(
                          'Thank you for choosing "Cozy"!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),

      ),

    );

  }
}