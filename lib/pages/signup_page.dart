import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'first_page.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // sign user up method
  Future<void> signUserUp() async {
    // Check if all required fields are filled
    if (usernameController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      // Show error message if any required field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in all required fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Check if passwords match
    if (!passwordConfirmed()) {
      // Show error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Create user with email and password
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Add user details
      await addUserDetails(
        usernameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        addressController.text.trim(),
      );

      // Navigate to the FirstPage after sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FirstPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "An error occurred"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  Future<void> addUserDetails(String fullName, String email, String phone, String address) async {
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).set({
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
    });
  }

  bool passwordConfirmed() {
    return passwordController.text.trim() == confirmPasswordController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.yellow.shade50,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    'Create a COZY account!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Name textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Full Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  // Address textfield
                  MyTextField(
                    controller: addressController,
                    hintText: 'Address',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  // Phone textfield
                  MyTextField(
                    controller: phoneController,
                    hintText: 'Mobile Number',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  // Email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  // Password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  // Confirm Password textfield
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  // Sign up button
                  MyButton(
                    onTap: signUserUp,
                    buttonText: "Sign Up",
                  ),
                  const SizedBox(height: 20),
                  // Already a member? Login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Login now',
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
      ),
    );
  }
}
