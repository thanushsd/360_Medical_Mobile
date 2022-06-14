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
import 'package:hos360/pages/app_con.dart';
import 'package:http/http.dart' as http;

class AppData {
  String? a_ppno;
  String? ptname;
  String? ptage;
  String? pttel;

  AppData({this.a_ppno, this.ptname, this.ptage, this.pttel});
}

class Appoinments extends StatefulWidget {
  const Appoinments({Key? key}) : super(key: key);

  @override
  State<Appoinments> createState() => _AppoinmentsState();
}

final int appid = appid;

class _AppoinmentsState extends State<Appoinments> {
  TextEditingController PatientName = TextEditingController();
  String get Name => PatientName.text;

  TextEditingController PatientAge = TextEditingController();
  String get Age => PatientAge.text;

  TextEditingController EmailController = TextEditingController();
  String get Email => EmailController.text;

  TextEditingController PhoneController = TextEditingController();
  String get Tel => PhoneController.text;

  TextEditingController nicController = TextEditingController();
  String get Nic => nicController.text; //

  Insertmethod() async {
    var theUrl = "https://360med.xyz/api/apps.php";
    Random random = new Random();
    final appid = random.nextInt(10000000);

    var res = await http.post(Uri.parse(theUrl), headers: {
      "Accept": "application/json"
    }, body: {
      "date": selectValue,
      "appno": appid.toString(),
      "pname": Name,
      "page": Age,
      "docid": selectedValue,
      "pemail": Email,
      "ptel": Tel,
    });
    var respBody = await json.decode(json.encode(res.body));
    print(respBody);

    AppData app = new AppData(
      a_ppno: appid.toString(),
      ptname: Name,
      ptage: Age,
      pttel: Tel,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppConfirm(app: app),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select Doctor"), value: "select"),
      DropdownMenuItem(
          child: Text("Thanush Dahanayaka"), value: "Thanush Dahanayaka"),
      DropdownMenuItem(
          child: Text("Adeesha Karunarasthne"), value: "Adeesha Karunarasthne"),
      DropdownMenuItem(
          child: Text("Maleesha Gimhana"), value: "Maleesha Gimhana"),
    ];
    return menuItems;
  }

  String selectedValue = "select";

  List<DropdownMenuItem<String>> get DateTimeSelect {
    List<DropdownMenuItem<String>> DateTimes = [
      DropdownMenuItem(child: Text("Select Date & Time"), value: "selected"),
      DropdownMenuItem(child: Text("Monday 5.00 PM"), value: "Monday 5.00 PM"),
      DropdownMenuItem(
          child: Text("Tuesday 5.00 PM"), value: "Tuesday 5.00 PM"),
      DropdownMenuItem(
          child: Text("Wednesday 5.00 PM"), value: "Wednesday 5.00 PM"),
      DropdownMenuItem(
          child: Text("Thusrsday 5.00 PM"), value: "Thursday 5.00 PM"),
      DropdownMenuItem(child: Text("Friday 5.00 PM"), value: "Friday 5.00 PM"),
    ];
    return DateTimes;
  }

  String selectValue = "selected";

  @override
  Widget build(BuildContext context) {
    final Sized = MediaQuery.of(context).size;
    return SlideInRight(
      duration: const Duration(microseconds: 900),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "Appoinments",
          ),
        ),
        drawer: GFDrawerNew(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Headline(
                    title: 'Channel A Doctor',
                    stitle: 'Create New Doctor Appoinment By Filling Form'),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 18, top: 8),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Color(0xff007a64),
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                        focusColor: Color(0xff007a64),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: Color(0xff007a64),
                        ),
                        isExpanded: true,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Color(0xff007a64),
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                        focusColor: Color(0xff007a64),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: Color(0xff007a64),
                        ),
                        isExpanded: true,
                        value: selectValue,
                        onChanged: (String? newValued) {
                          setState(() {
                            selectValue = newValued!;
                          });
                        },
                        items: DateTimeSelect),
                  ),
                ),
                EmailInputFb2(
                  inputController: PatientName,
                  hinttext: 'Enter Patient Name',
                  title: 'Name',
                ),
                EmailInputFb2(
                  inputController: PatientAge,
                  hinttext: 'Patient Age',
                  title: 'Age',
                ),
                EmailInputFb2(
                  inputController: nicController,
                  hinttext: 'Patient NIC',
                  title: 'NIC',
                ),
                EmailInputFb2(
                  inputController: EmailController,
                  hinttext: 'Patient Email',
                  title: 'Email',
                ),
                EmailInputFb2(
                  inputController: PhoneController,
                  hinttext: 'Patient Phone No',
                  title: 'Phone No',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 0,
                    child: ElevatedButton(
                      child: Text('Complete Booking'),
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
                        Insertmethod();
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
