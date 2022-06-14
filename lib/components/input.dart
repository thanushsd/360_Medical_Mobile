import 'package:flutter/material.dart';

class EmailInputFb2 extends StatelessWidget {
  final TextEditingController inputController;
  final String hinttext;
  final String title;

  const EmailInputFb2({
    Key? key,
    required this.inputController,
    required this.hinttext,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff007a64);
    const secondaryColor = Color(0xff007a64);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
            child: TextField(
              controller: inputController,
              onChanged: (value) {
                //Do something wi
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                label: Text(title),
                labelStyle: const TextStyle(color: primaryColor),
                // prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: accentColor,
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
