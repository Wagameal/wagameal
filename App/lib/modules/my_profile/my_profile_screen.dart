import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_profile_controller.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileController>(
      builder: (controller) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
      ),
    );
  }
}
