import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image != null
              ? Image.file(
                  image!,
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "assets/images/user.jpeg",
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  child: const Row(
                    children: [
                      Icon(Icons.photo),
                      Text("Gallery"),
                    ],
                  )),
              const SizedBox(
                width: 16.0,
              ),
              TextButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  child: const Row(
                    children: [
                      Icon(Icons.camera),
                      Text("Camera"),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Badal Kumar",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            "user_email@gmail.com",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  // openGallery() async {
  //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (image != null) {
  //     this.image = File(image.path);
  //     setState(() {});
  //   }
  // }
  //
  // openCamera() async {
  //   XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //
  //   if (image != null) {
  //     this.image = File(image.path);
  //     setState(() {});
  //   }
  // }

  pickImage(ImageSource source)async{
    XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      this.image = File(image.path);
      print(this.image!.path);
      setState(() {});
    }
  }
}
