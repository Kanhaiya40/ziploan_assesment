import 'package:flutter_test/flutter_test.dart';
import 'package:ziploan/constants/string.dart';
import 'package:ziploan/validator/mobile_validator.dart';
import 'package:ziploan/validator/otp_validator.dart';

void main() {
  test('Testing Mobile Number emptyness', () {
    var result = MobileNumberValidator.validate('');
    expect(result, enterText);
  });

  test('Testing Valid Mobile Number', () {
    var result = MobileNumberValidator.validate('7024860732');
    expect(result, null);
  });

  test('Testing Invalid Mobile Number', () {
    var result = MobileNumberValidator.validate('6578543456');
    expect(result, invalidMobileNumber);
  });

  test('Testing for empty otp', () {
    var result = OtpValidator.validateOtp('');
    expect(result, otpValidationInstruction);
  });

  test('Testing for otp length less than 4', () {
    var result = OtpValidator.validateOtp('123');
    expect(result, otpValidationInstruction);
  });
}
