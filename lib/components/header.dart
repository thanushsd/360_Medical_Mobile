import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({
    Key? key,
    required this.title,
    required this.stitle,
  }) : super(key: key);

  final String title;
  final String stitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 25.0, bottom: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                stitle,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
