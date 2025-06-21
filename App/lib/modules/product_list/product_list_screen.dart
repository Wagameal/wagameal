import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_list_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
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
