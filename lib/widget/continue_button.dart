import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildContinueButton({func, context,isChecked}) {
  return SizedBox(
    height: 40,
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.red)))),
      onPressed: () {
        print(isChecked);
        if(isChecked!=null){
          if(func!=null && isChecked)
            func();
        }else{
          if(func!=null)
            func();
        }

      },
      child: const Text(
        'Continue',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
