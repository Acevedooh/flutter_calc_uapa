import 'package:flutter/material.dart';

class MyBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.blue[100],
        ));
  }
}
