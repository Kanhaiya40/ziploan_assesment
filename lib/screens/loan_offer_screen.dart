import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziploan/constants/color.dart';
import 'package:ziploan/constants/string.dart';

class LoanOfferPage extends StatefulWidget {
  const LoanOfferPage({Key? key}) : super(key: key);

  @override
  _LoanOfferPageState createState() => _LoanOfferPageState();
}

class _LoanOfferPageState extends State<LoanOfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Image.asset(defaultImagePath + 'offer.png'),
            ),
          )),
          Container(
            decoration: BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
