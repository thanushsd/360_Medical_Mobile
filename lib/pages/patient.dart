// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
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
import 'package:http/http.dart' as http;

class pdata {
  String? aid;

  pdata({this.aid});
}

class Admission extends StatefulWidget {
  const Admission({Key? key}) : super(key: key);

  @override
  State<Admission> createState() => _AdmissionState();
}

final int appid = appid;

class _AdmissionState extends State<Admission> {
  TextEditingController sController = TextEditingController();
  String get Search => sController.text;

  Pnomethod() {
    pdata app = new pdata(
      aid: Search,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pdc(
          app: app,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Sized = MediaQuery.of(context).size;
    return SlideInRight(
      duration: const Duration(microseconds: 900),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "Admissions",
          ),
        ),
        drawer: GFDrawerNew(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Headline(
                    title: 'Admitted Patients',
                    stitle: 'Track Your Admission Details'),
                EmailInputFb2(
                  inputController: sController,
                  hinttext: 'Enter Admission ID',
                  title: 'Admission ID',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 0,
                    child: ElevatedButton(
                      child: Text('View Details'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Color(0xff007a64),
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      onPressed: () {
                        Pnomethod();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBarFb2(),
      ),
    );
  }
}
