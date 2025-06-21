import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_messages_controller.dart';

class AllMessagesScreen extends StatefulWidget {
  const AllMessagesScreen({Key? key}) : super(key: key);

  @override
  AllMessagesState createState() => AllMessagesState();
}

class AllMessagesState extends State<AllMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMessagesController>(
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
