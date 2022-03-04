import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ziploan/validator/otp_validator.dart';
import 'package:ziploan/widget/continue_button.dart';

import '../constants/color.dart';
import '../constants/string.dart';
import '../routings/routing_constant.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool hasError = false;
  final _formKey = GlobalKey<FormState>();
  late String otp = '';

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        resizeToAvoidBottomInset:
            orientation == Orientation.landscape ? false : true,
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(defaultImagePath + 'otp_welcom.png'),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            autoDismissKeyboard: true,
                            length: 4,
                            validator: (otpCode) =>
                                OtpValidator.validateOtp(otpCode!),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderWidth: 0.4,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              inactiveFillColor: Colors.white,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            keyboardType: TextInputType.number,
                            onCompleted: (code) {
                              otp = code;
                            },
                            onChanged: (value) {
                              otp = value;
                            },
                          )),
                      SizedBox(
                        height: 150,
                      ),
                      buildContinueButton(
                          func: validateFormAndNavigateToPanCard,
                          context: context)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  validateFormAndNavigateToPanCard() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      if (otp != "1234") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(wrongOtp)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(correctOtp)),
        );
        Navigator.pushNamed(context, panCardPage);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(enterPan)),
        );
      }
    }
  }
}
