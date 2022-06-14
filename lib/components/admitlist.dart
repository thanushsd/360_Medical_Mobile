import 'package:flutter/material.dart';

class ListAdmit extends StatelessWidget {
  const ListAdmit({
    Key? key,
    required this.stitle,
    required this.title,
  }) : super(key: key);

  final String title;
  final String stitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '- ' + stitle,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
