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
                  onPressed: () => {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
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
