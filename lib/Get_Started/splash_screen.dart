import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hos360/Get_Started/home.dart';
import 'package:loading_animations/loading_animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xfffff),
        width: Size.width,
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: Size.width / 2,
              ),
              Tab(
                child: LoadingBouncingLine.circle(
                  size: 30,
                  backgroundColor: const Color(0xff007a64),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
