import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'faq_controller.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  FaqState createState() => FaqState();
}

class FaqState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
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
