import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ziploan/constants/color.dart';
import 'package:ziploan/constants/string.dart';
import 'package:ziploan/constants/text_styles.dart';
import 'package:ziploan/routings/routing_constant.dart';
import 'package:ziploan/validator/mobile_validator.dart';
import 'package:ziploan/widget/continue_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<_LoginState>.
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;

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
                  child: Image.asset(
                      defaultImagePath + 'login_welcome_content.png'),
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
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(mobileNumber),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) =>
                            MobileNumberValidator.validate(value!),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        otpInstruction,
                        style: instructions,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: Colors.green,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            checkBoxInstruction,
                            style: checkBoxInstructionsStyle,
                          ))
                        ],
                      ),
                      Text(
                        isChecked ? '' : checkboxError,
                        style: checkBoxErrorStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildContinueButton(
                          func: validateFormAndNavigateToOtpScreen,
                          context: context,
                          isChecked: isChecked),
                      // Add TextFormFields and ElevatedButton here.
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

  validateFormAndNavigateToOtpScreen() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter Otp Now')),
      );
      Navigator.pushNamed(context, otpPage);
    }
  }
}
