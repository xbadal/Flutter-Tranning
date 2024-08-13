import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_screen/screen/signup/radio_widget.dart';
import 'package:profile_screen/style/text_style.dart';

import 'checkbox_widget.dart';

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
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Gender",
                      style: robotoTextStyle(),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioWidget(
                              value: 0,
                              groupValue: selectedGender,
                              onChange: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              title: "Male",
                            ),
                          ),
                          Expanded(
                              child: RadioWidget(
                            value: 1,
                            groupValue: selectedGender,
                            onChange: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            title: "Female",
                          )),
                          Expanded(
                              child: RadioWidget(
                            value: 2,
                            groupValue: selectedGender,
                            onChange: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            title: "Others",
                          )),
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Hobbies",
                      style: robotoTextStyle(),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                              child: CheckboxWidget(
                            title: "Cricket",
                            value: isCricketChecked,
                            onChange: (value) {
                              setState(() {
                                isCricketChecked = value;
                              });
                            },
                          )),
                          Expanded(
                              child: CheckboxWidget(
                            title: "Singing",
                            value: isSingingChecked,
                            onChange: (value) {
                              setState(() {
                                isSingingChecked = value;
                              });
                            },
                          )),
                          Expanded(
                              child: CheckboxWidget(
                            title: "Dancing",
                            value: isDanceChecked,
                            onChange: (value) {
                              setState(() {
                                isDanceChecked = value;
                              });
                            },
                          )),
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Hobbies",
                      style: robotoTextStyle(),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        value: selectedCounty,
                        items: country
                            .map((c) => DropdownMenuItem(
                                  value: c,
                                  child: Text(c),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCounty = value!;
                          });
                        }),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Age"),
                  Slider(
                      value: age,
                      min: 18.0,
                      max: 60.0,
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      })
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text("Age"),
                  CupertinoSlider(
                      value: age,
                      min: 18.0,
                      max: 60.0,
                      thumbColor: Colors.red,
                      divisions: 10,
                      onChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text("Salary"),
                  RangeSlider(
                      values: RangeValues(18, 40),
                      min: 18.0,
                      max: 60.0,
                      divisions: 10,
                      onChanged: (value) {})
                ],
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
                        _showConfimationPopUp(context);
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
}
