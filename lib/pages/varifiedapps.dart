import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hos360/components/BottomNavbar.dart';
import 'package:hos360/components/admitlist.dart';
import 'package:hos360/components/appbar.dart';
import 'package:hos360/components/card.dart';
import 'package:hos360/components/dialog.dart';
import 'package:hos360/components/header.dart';
import 'package:hos360/pages/app.dart';
import 'package:hos360/pages/doctor.dart';
import 'package:hos360/pages/myapps.dart';
import 'package:hos360/pages/patient.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DocAppDataV extends StatefulWidget {
  final trackapp app;
  DocAppDataV({Key? key, required this.app}) : super(key: key);

  @override
  State<DocAppDataV> createState() => _DocAppDataVState();
}

class _DocAppDataVState extends State<DocAppDataV> {
  // Future admitdata() async {
  //   var url = 'https://360med.xyz/api/admit.php?aid=${(widget.app.aid)}';
  //   var response = await http.get(Uri.parse(url));
  //   return json.decode(response.body);
  // }

  getData() async {
    var response = await http.get(Uri.parse(
        'https://360med.xyz/api/docappV.php?aid=${(widget.app.aid)}'));
    var JsonData = jsonDecode(response.body);

    List<AdData> users = [];

    for (var u in JsonData) {
      AdData user = AdData(u["pname"], u["appdate"], u["apptime"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNew(
            title: "Verified Appoinments",
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                              child: LoadingAnimationWidget.beat(
                            color: Color(0xff007a64),
                            size: 30,
                          )),
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 1, left: 14, right: 14),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 3,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              GFListTile(
                                avatar: GFAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://i.postimg.cc/wBtJB2VL/user.jpg")),
                                titleText: snapshot.data[i].pname,
                                subTitleText: 'Date : ' +
                                    snapshot.data[i].appdate +
                                    ' | Time : ' +
                                    snapshot.data[i].apptime,
                              ),
                            ],
                          );
                        });
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarFb2(),
    );
  }
}

class AdData {
  final String pname, appdate, apptime;
  AdData(this.pname, this.appdate, this.apptime);
}
