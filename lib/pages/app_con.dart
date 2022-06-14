import 'package:flutter/material.dart';
import 'package:hos360/components/BottomNavbar.dart';
import 'package:hos360/components/appbar.dart';
import 'package:hos360/components/dialog.dart';
import 'package:hos360/pages/app.dart';

class AppConfirm extends StatefulWidget {
  final AppData app;
  AppConfirm({Key? key, required this.app}) : super(key: key);

  @override
  State<AppConfirm> createState() => _AppConfirmState();
}

class _AppConfirmState extends State<AppConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "Appoinment Confirmed",
          )),
      body: Container(
        child: Column(
          children: [
            DialogFb3(
              appno: widget.app.a_ppno.toString(),
              title: "Appoinment Confirmed",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarFb2(),
    );
  }
}
