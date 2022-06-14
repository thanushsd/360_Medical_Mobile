import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AppBarNew extends StatelessWidget {
  const AppBarNew({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      iconTheme: IconThemeData(color: Color(0xff007a64)),
      backgroundColor: Color(0xFFEFEFEF),
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff007a64)),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.elliptical(25, 10),
      //   ),
      // ),
      actions: <Widget>[
        GFIconButton(
          icon: Icon(
            Icons.notifications,
            color: Color(0xff007a64),
          ),
          onPressed: () {},
          type: GFButtonType.transparent,
        ),
      ],
    );
  }
}
