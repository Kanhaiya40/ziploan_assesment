import '../constants/string.dart';

class OtpValidator{
  static String? validateOtp(String value){
    return value.length < 4 || value.isEmpty ? otpValidationInstruction:null;
  }
}