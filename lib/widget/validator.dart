bool validateMobileNumber(String number) {
  String pattern = r'^(?:[7-9]{1}\d{1})?[0-9]{8}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(number)) {
    print(regExp.firstMatch(number));
    return true;
  }
  return false;
}
