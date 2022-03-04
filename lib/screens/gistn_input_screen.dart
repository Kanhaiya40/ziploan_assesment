import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ziploan/constants/color.dart';
import 'package:ziploan/models/gistn_info.dart';
import 'package:ziploan/routings/routing_constant.dart';
import 'package:ziploan/widget/continue_button.dart';

import '../constants/string.dart';

class GistInput extends StatefulWidget {
  const GistInput({Key? key}) : super(key: key);

  @override
  _GistInputState createState() => _GistInputState();
}

class _GistInputState extends State<GistInput> {
  List<GistnInfo> _gistnInfo = GistnInfo.gistnInfos;
  String? checkedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkedValue = '1';
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        resizeToAvoidBottomInset:
            orientation == Orientation.landscape ? false : true,
        backgroundColor: primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Container(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(defaultImagePath + 'gist_welcome.png'),
                ),
              ),
            )),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: appWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _gistnInfo.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildCountriesLayout(
                                    _gistnInfo[index], context);
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          buildContinueButton(
                              func: checkAndGoToOfferLoaderPage,
                              context: context)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget buildCountriesLayout(GistnInfo gistnInfo, BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: gistnInfo.id!,
            groupValue: checkedValue,
            onChanged: (value) {
              setState(() {
                checkedValue = gistnInfo.id!;
              });
            }),
        Text(gistnInfo.code!)
      ],
    );
  }

  checkAndGoToOfferLoaderPage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Generating Offer')),
    );
    Navigator.pushNamed(context, gistLoaderPage);
  }
}
