// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hos360/components/BottomNavbar.dart';
import 'package:hos360/components/appbar.dart';
import 'package:hos360/components/appbarDrawer.dart';
import 'package:hos360/pages/app.dart';
import 'package:hos360/pages/doctor.dart';
import 'package:hos360/pages/myapps.dart';
import 'package:hos360/pages/patient.dart';

class HomePage extends StatefulWidget implements PreferredSizeWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

final List<String> imageList = [
  "https://i.postimg.cc/nLLXZgW9/img003.png",
  "https://i.postimg.cc/8Cj28wZ1/img001.png",
  "https://i.postimg.cc/1XC2qgHK/img002.png",
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "Home",
          ),
        ),
        drawer: GFDrawerNew(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GFCarousel(
                items: imageList.map(
                  (url) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.network(url,
                            fit: BoxFit.cover, width: 1000.0),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Appoinments()));
                    },
                    leading: Icon(
                      Icons.book_online_outlined,
                      color: Color(0xff007a64),
                    ),
                    title: Text(
                      "Channel A Doctor",
                      style: TextStyle(
                        color: Color(0xff007a64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Admission()));
                    },
                    leading: Icon(
                      Icons.person,
                      color: Color(0xff007a64),
                    ),
                    title: Text(
                      "Patient Admissions",
                      style: TextStyle(
                        color: Color(0xff007a64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DocAppData()));
                    },
                    leading: Icon(
                      Icons.add_box,
                      color: Color(0xff007a64),
                    ),
                    title: Text(
                      "Doctors LogIn",
                      style: TextStyle(
                        color: Color(0xff007a64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyAppData()));
                    },
                    leading: Icon(
                      Icons.event_note,
                      color: Color(0xff007a64),
                    ),
                    title: Text(
                      "Track My Appoinments",
                      style: TextStyle(
                        color: Color(0xff007a64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarFb2(),
      ),
    );
  }
}
