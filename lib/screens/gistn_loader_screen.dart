import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziploan/routings/routing_constant.dart';

import '../constants/color.dart';
import '../constants/string.dart';
import '../widget/continue_button.dart';

class GistnLoader extends StatefulWidget {
  const GistnLoader({Key? key}) : super(key: key);

  @override
  _GistnLoaderState createState() => _GistnLoaderState();
}

class _GistnLoaderState extends State<GistnLoader> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToGistnInputPage();
  }

  Future<void> goToGistnInputPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushNamed(context, loanOfferPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(defaultImagePath + 'gistn_welcome.png'),
                  ),
                ),
              )),
              Container(
                decoration: BoxDecoration(
                    color: appWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      buildContinueButton(context: context),
                      // Add TextFormFields and ElevatedButton here.
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.62)),
            child: Center(
              child: Image.asset(defaultImagePath + 'pan_card_loader.png'),
            ),
          )
        ],
      ),
    );
  }
}
