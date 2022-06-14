import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hos360/components/BottomNavbar.dart';
import 'package:hos360/components/admitlist.dart';
import 'package:hos360/components/appbar.dart';
import 'package:hos360/pages/myapps.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyAppDetails extends StatefulWidget {
  final myapp app;
  MyAppDetails({Key? key, required this.app}) : super(key: key);

  @override
  State<MyAppDetails> createState() => _MyAppDetailsState();
}

class _MyAppDetailsState extends State<MyAppDetails> {
  // Future admitdata() async {
  //   var url = 'https://360med.xyz/api/admit.php?aid=${(widget.app.aid)}';
  //   var response = await http.get(Uri.parse(url));
  //   return json.decode(response.body);
  // }

  getData() async {
    var response = await http.get(Uri.parse(
        'https://360med.xyz/api/appview.php?aid=${(widget.app.aid)}'));
    var JsonData = jsonDecode(response.body);

    List<AdData> users = [];

    for (var u in JsonData) {
      AdData user = AdData(
        u["pname"],
        u["date"],
        u["docid"],
        u["tel"],
        u["page"],
        u["email"],
      );
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
            title: "Appoinment Details",
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Image.asset(
                                          'assets/images/myapp.gif',
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GFListTile(
                                avatar: GFAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://i.postimg.cc/wBtJB2VL/user.jpg")),
                                titleText: snapshot.data[i].pname,
                                subTitleText: 'Age : ' + snapshot.data[i].page,
                              ),
                              Column(
                                children: [
                                  ListAdmit(
                                    title: "Channeled Doctor",
                                    stitle: snapshot.data[i].docid,
                                  ),
                                  ListAdmit(
                                    title: "Appoinment Date",
                                    stitle: snapshot.data[i].date,
                                  ),
                                  ListAdmit(
                                    title: "Patient Email",
                                    stitle: snapshot.data[i].email,
                                  ),
                                  ListAdmit(
                                    title: "Patient Phone No",
                                    stitle: snapshot.data[i].tel,
                                  ),
                                ],
                              )
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
  final String pname, date, docid, tel, page, email;
  AdData(this.pname, this.date, this.docid, this.tel, this.page, this.email);
}
