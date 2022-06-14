import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hos360/Get_Started/home.dart';
import 'package:hos360/pages/about.dart';
import 'package:hos360/pages/app.dart';
import 'package:hos360/pages/doctor.dart';
import 'package:hos360/pages/myapps.dart';
import 'package:hos360/pages/patient.dart';

class GFDrawerNew extends StatelessWidget {
  const GFDrawerNew({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff007a64),
            ),
            currentAccountPicture: Image.asset('assets/images/splash.png'),
            accountName: Text(
              "| 360 Medical |",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            accountEmail: Text(""),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Channel Doctor"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Appoinments()));
            },
            leading: Icon(Icons.book_online),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Admitted Patient"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Admission()));
            },
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("My Appoinments"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAppData()));
            },
            leading: Icon(Icons.medical_services),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Doctor "),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DocAppData()));
            },
            leading: Icon(Icons.add_box),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("About Us "),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
            leading: Icon(Icons.group),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
