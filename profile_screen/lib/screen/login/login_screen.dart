import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_screen/screen/login/login_controller.dart';
import 'package:profile_screen/screen/signup/sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Please enter your details"),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  onChanged: (String text) {
                    print(text);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Email',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(() => TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.passwordController,
                      onChanged: (String text) {
                        print(text);
                      },
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.togglePassword();
                              },
                              icon: controller.hidePassword.value
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
                    )),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () => controller.login(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () => controller.resetPassword(),
                  child: Text("Reset Password"),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont Have an Account"),
                    const SizedBox(
                      width: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text("Sign up"),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      init: LoginController(),
    );
  }
}
