import 'package:flutter/material.dart';

class DialogFb3 extends StatelessWidget {
  const DialogFb3({
    Key? key,
    required this.title,
    required this.appno,
  }) : super(key: key);

  final primaryColor = const Color(0xff007a64);
  final secondaryColor = const Color(0xff007a64);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);
  final String title;
  final String appno;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        width: MediaQuery.of(context).size.width / 0,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [primaryColor, secondaryColor]),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: accentColor.withOpacity(.05),
              radius: 25,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/FlutterBricksLogo-Med.png?alt=media&token=7d03fedc-75b8-44d5-a4be-c1878de7ed52"),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(title,
                style: TextStyle(
                    color: accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            Text("Appoinment ID : " + appno,
                style: TextStyle(
                    color: accentColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 15,
            ),
            Text("Please Remember This Number",
                style: TextStyle(
                    color: accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
