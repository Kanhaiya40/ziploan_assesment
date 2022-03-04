import '../constants/string.dart';
import '../widget/validator.dart';

class MobileNumberValidator{
  static String? validate(String value){
    return value == null || value.isEmpty ? enterText:validateMobileNumber(value)?null:invalidMobileNumber;
  }

}