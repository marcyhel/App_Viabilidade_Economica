import 'package:flutter/material.dart';

class CardImput extends StatelessWidget {
  String title;
  CardImput({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 1), blurRadius: 15, color: Colors.black12),
        ],
      ),
      margin: EdgeInsets.only(top: 5, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withAlpha(120),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(
              fontSize: 19,
              color: Colors.black.withAlpha(120),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              fillColor: Colors.blueGrey.withAlpha(10),
              filled: true,
              isDense: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
