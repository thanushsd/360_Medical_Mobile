// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
import 'package:about/about.dart';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hos360/Get_Started/home.dart';
import 'package:hos360/components/BottomNavbar.dart';
import 'package:hos360/components/appbar.dart';
import 'package:hos360/components/appbarDrawer.dart';
import 'package:hos360/components/header.dart';
import 'package:hos360/components/input.dart';
import 'package:hos360/pages/Patient_d.dart';
import 'package:hos360/pages/app_con.dart';
import 'package:hos360/pages/myapp_d.dart';
import 'package:http/http.dart' as http;

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  TextEditingController sController = TextEditingController();
  String get Search => sController.text;
  @override
  Widget build(BuildContext context) {
    final Sized = MediaQuery.of(context).size;
    return SlideInRight(
      duration: const Duration(microseconds: 900),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "About Us",
          ),
        ),
        drawer: GFDrawerNew(),
        body: Container(
          child: Column(
            children: [],
          ),
        ),
        bottomNavigationBar: BottomNavBarFb2(),
      ),
    );
  }
}
