import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_us_controller.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  AboutUsState createState() => AboutUsState();
}

class AboutUsState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
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
