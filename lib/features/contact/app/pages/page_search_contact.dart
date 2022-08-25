import 'package:flutter/material.dart';

class PageSearchContact extends StatefulWidget {
  const PageSearchContact({Key? key}) : super(key: key);

  @override
  State<PageSearchContact> createState() => _PageSearchContactState();
}

class _PageSearchContactState extends State<PageSearchContact> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: ListView(),
      ),
    );
  }
}
