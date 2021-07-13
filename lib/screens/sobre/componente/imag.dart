import 'package:flutter/material.dart';

class Imag extends StatelessWidget {
  String img;
  Imag({
    Key? key,
    required this.img,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
