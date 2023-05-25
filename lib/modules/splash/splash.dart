import 'package:flutter/material.dart';
import 'package:my_application/constant.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: gradiantBackround,
        child: Image.asset('assets/images/i1.png'),
      ),
    );
  }
}
