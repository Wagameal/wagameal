import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(child: InkWell(
            onTap: (){
              controller.userLoginVerify();
            },
            child: Container(
                width: 100,
                height: 50,
                color: Colors.red,
                child: Center(child: Text("Shreekant"))),
          )),
        ),
      ),
    );
  }
}
