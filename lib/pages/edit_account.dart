import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  String gender = '';
  Uint8List? image;
  File? selectedImage;

  String fullName = '';
  String email = '';
  String phone = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (snapshot.exists) {
        setState(() {
          fullName = snapshot.data()!['fullName'];
          email = snapshot.data()!['email'];
          phone = snapshot.data()!['phone'];
          address = snapshot.data()!['address'];
        });
        print('Fetched user data: $fullName, $email, $phone, $address'); // Debug print
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade800,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Account',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_back),
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildEditItem("Photo", _buildPhotoWidget()),
            const SizedBox(height: 20),
            _buildEditItem("Name", TextField(
              controller: TextEditingController(text: fullName),
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            )),
            const SizedBox(height: 20),
            _buildEditItem("Phone", TextField(
              controller: TextEditingController(text: phone),
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
              ),
            )),
            const SizedBox(height: 20),
            _buildEditItem("Email", TextField(
              controller: TextEditingController(text: email),
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            )),
            const SizedBox(height: 20),
            _buildEditItem("Address", TextField(
              controller: TextEditingController(text: address),
              decoration: InputDecoration(
                hintText: 'Enter your address',
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildEditItem(String title, Widget widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoWidget() {
    return Column(
      children: [
        image != null
            ? CircleAvatar(
          radius: 50,
          backgroundImage: MemoryImage(image!),
        )
            : const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("lib/images/user.png"),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            showImagePickerOption(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            backgroundColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Upload Image"),
        ),
      ],
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Choose Image",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _pickImage(ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text("Camera"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("Gallery"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      final bytes = await pickedImageFile.readAsBytes(); // Asynchronous read
      setState(() {
        image = bytes.buffer.asUint8List();
      });
      Navigator.of(context).pop(); // Close the bottom sheet
    }
  }

  Widget _buildGenderIconButton(IconData icon, String genderType) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          gender = genderType;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: gender == genderType ? Colors.yellow.shade800 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      icon: Icon(
        icon,
        color: gender == genderType ? Colors.white : Colors.black,
        size: 24,
      ),
      label: Text(
        genderType,
        style: TextStyle(
          color: gender == genderType ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
