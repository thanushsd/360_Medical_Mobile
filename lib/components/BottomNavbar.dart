import 'package:flutter/material.dart';
import 'package:hos360/Get_Started/home.dart';
import 'package:hos360/pages/app.dart';
import 'package:hos360/pages/doctor.dart';
import 'package:hos360/pages/patient.dart';

class BottomNavBarFb2 extends StatelessWidget {
  const BottomNavBarFb2({Key? key}) : super(key: key);

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff007a64),
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }),
              IconBottomBar(
                  text: "Appoinments",
                  icon: Icons.book_online_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Appoinments()),
                    );
                  }),
              IconBottomBar(
                  text: "Patients",
                  icon: Icons.person,
                  selected: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Admission()),
                    );
                  }),
              IconBottomBar(
                  text: "Doctor",
                  icon: Icons.add_box,
                  selected: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DocAppData()),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              height: .1,
              color: selected ? primaryColor : Colors.black),
        )
      ],
    );
  }
}
