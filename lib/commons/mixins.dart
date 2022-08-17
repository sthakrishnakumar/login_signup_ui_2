mixin InputValidationMixin {
  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regx = RegExp(pattern.toString());
    return regx.hasMatch(email);
  }

  bool isloginPasswordValid(String password) => password.length > 7;

  bool isFirstNameValid(String name) => name.length > 2;

  bool isLastNameValid(String name) => name.length > 2;

  bool isParentPhoneValid(String phone) => phone.length > 9;

  bool isPhoneValid(String phone) => phone.length > 9;

  bool isOTPValid(String otp) => otp.length > 5;

  bool isPasswordValid(String password) => password.length > 7;
}
