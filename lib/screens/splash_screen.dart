import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ziploan/routings/routing_constant.dart';

import '../constants/string.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: SvgPicture.asset(defaultImagePath + 'Vector.svg'),
      ),
    );
  }

  Future<void> goToLoginPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushNamed(context, loginPage);
  }
}
