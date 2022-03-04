import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ziploan/constants/text_styles.dart';
import 'package:ziploan/routings/routing_constant.dart';

import '../constants/color.dart';
import '../constants/string.dart';
import '../widget/continue_button.dart';

class Pan extends StatefulWidget {
  const Pan({Key? key}) : super(key: key);

  @override
  _PanState createState() => _PanState();
}

class _PanState extends State<Pan> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isMatching = false;

  RegExp validatePanCard =
      RegExp(r'^([a-z]{3}[P]\d{4}[a-z]{1})$', caseSensitive: false);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation) {
        return Scaffold(
          resizeToAvoidBottomInset: orientation == Orientation.landscape ? false:true,
          backgroundColor: primaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(defaultImagePath + 'pan_card_welcom.png'),
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
                          keyboardType: TextInputType.text,
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: pan,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                          ],
                          onChanged: (text) {
                            if (text.length == 3) {
                              _controller.text = _controller.text + 'P';
                              _controller.selection = TextSelection.fromPosition(
                                  TextPosition(offset: _controller.text.length));
                            }
                            if (validatePanCard.hasMatch(text)) {
                              setState(() {
                                isMatching = true;
                              });
                            } else {
                              setState(() {
                                isMatching = false;
                              });
                            }
                          },
                          onFieldSubmitted: (value) {},
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return enterText;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Text(
                          isMatching ? '' : panCardValidationError,
                          style: checkBoxErrorStyle,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        buildContinueButton(
                            func: validateFormAndNavigateToPanCardLoader,
                            context: context,
                            isChecked: isMatching),
                        // Add TextFormFields and ElevatedButton here.
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  validateFormAndNavigateToPanCardLoader() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(''
                'Uploading Pan Card...')),
      );
      Navigator.pushNamed(context, panCardLoaderPage);
    }
  }

  //Listener
  void restrictCharacters() {
    RegExp regexp = new RegExp(
      r"^|\-|\,|\ ",
      caseSensitive: false,
      multiLine: false,
    );
    String text = _controller.text;
    String chng = text.replaceAll(regexp, "");
    _controller.text = chng;
  }
}
