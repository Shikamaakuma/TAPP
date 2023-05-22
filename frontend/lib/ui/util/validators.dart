String? emailValidator(String? value) {
  String? _msg;
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value!.isEmpty) {
    _msg = "Your e-mail is required";
  } else if (!regex.hasMatch(value)) {
    _msg = "Please provide a valid e-mail address";
  }
  return _msg;
}

String? passWordValidator(String? value) {
  if (value!.isEmpty) return 'Please enter some text';

  bool matchPolicy = true;

  if (value.length < 6) matchPolicy = false;

  RegExp upperCaseRegexp = new RegExp(r'[A-Z]');
  if (!upperCaseRegexp.hasMatch(value)) matchPolicy = false;

  RegExp lowerCaseRegexp = new RegExp(r'[a-z]');
  if (!lowerCaseRegexp.hasMatch(value)) matchPolicy = false;

  RegExp digitRegexp = new RegExp(r'\d');
  if (!digitRegexp.hasMatch(value)) matchPolicy = false;

  RegExp symbolRegexp = new RegExp(r'\W');
  if (!symbolRegexp.hasMatch(value)) matchPolicy = false;

  if (matchPolicy)
    return null;
  else
    return 'Password does not match policy';
}

String? emptyValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}

String? confirmPasswordValidator(
    String? passwordValue, String? confirmPasswordValue) {
  if (confirmPasswordValue!.isEmpty) {
    return 'Please enter some text';
  }
  if (passwordValue != confirmPasswordValue) {
    return 'Passwords do not match';
  }
  return null;
}

String? intRangeValidator(String? input, int min, int max) {
  if(input == null || input!.isEmpty) {
    return 'Please enter a number';
  } else {
    int? inputInt = int.tryParse(input);
    if (inputInt == null) {
      return 'Please enter a number';
    } else {
      if (inputInt < min || inputInt > max) {
        return 'Enter a number between $min and $max';
      } else {
        return null;
      }
    }
  }
}