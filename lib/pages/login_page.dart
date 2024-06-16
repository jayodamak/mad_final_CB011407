import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'first_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signUserIn(BuildContext context) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          );
        },
      );

      // Sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Dismiss loading indicator
      Navigator.pop(context);

      // Navigate to the FirstPage after sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FirstPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Dismiss loading indicator
      Navigator.pop(context);

      // Show error message
      showErrorMessage(context, e.message ?? "An error occurred");
    }
  }

  // Show error message in a SnackBar
  void showErrorMessage(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.yellow[50],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                // Logo
                Image.asset(
                  'lib/images/logo.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 10),

                Text(
                  'Welcome back to COZY!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                // Password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // Sign in button
                MyButton(
                  onTap: () => signUserIn(context),
                  buttonText: "Sign In",
                ),

                const SizedBox(height: 50),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
