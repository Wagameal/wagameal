import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pet_profile_controller.dart';

class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({Key? key}) : super(key: key);

  @override
  PetProfileState createState() => PetProfileState();
}

class PetProfileState extends State<PetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetProfileController>(
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
