import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main/main_screen.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  int selectedGender = 0;
  bool isCricketChecked = false;
  bool isDanceChecked = false;
  bool isSingingChecked = false;

  List<String> country = ["India", "Nepal", "UK", "USA", "Dubai"];

  String selectedCounty = '';

  double age = 19.0;

  // Firebase Database Instance
  FirebaseDatabase database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          "https://profile-screen-b6a84-default-rtdb.asia-southeast1.firebasedatabase.app");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCounty = country[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                onChanged: (String text) {},
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onChanged: (String text) {
                  print(text);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                onChanged: (String text) {
                  print(text);
                },
                obscureText: hidePassword,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: hidePassword
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.green,
                              )),
                    labelText: 'Password',
                    border: const OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        // Show error

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Enter email"),
                          action: SnackBarAction(
                              label: "undo",
                              onPressed: () {
                                // Print Undo
                              }),
                        ));

                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(SnackBar(content: Text("Enter email")));
                      } else {
                        signUp();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showConfimationPopUp(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SelectableText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                      // Sign up logic
                    },
                    child: Text("Confirm"))
              ],
            ),
          );
        });
  }

  List<DropdownMenuItem<String>> _getDrowdownItem() {
    List<DropdownMenuItem<String>> items = [];

    for (int i = 0; i < country.length; i++) {
      items.add(DropdownMenuItem<String>(
        value: country[i],
        child: Text(country[i]),
      ));
    }

    return items;
  }

  getCounry() {
    // Server
  }

  // Business logic
  signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        Map<String, dynamic> userData = {
          "email": credential.user!.email,
        };

        try {
          DatabaseReference ref = database.ref("users/${credential.user!.uid}");

          await ref.set(userData);
        } catch (e) {
          print(e.toString());
        } finally {
          Get.to(MainScreen(email: email));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
