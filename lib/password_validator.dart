library password_validator;

class PasswordValidator {
  //bool spaces;
  int uppercase, min, max, digits;
  List<String> blacklist;
  String password;

  PasswordValidator(
      {int uppercase = 0,
      int min = 0,
      int max = 0,
      int digits = 0,
      List<String> blacklist}) {
    this.uppercase = uppercase; // Minimum number of uppercase letters
    //this.spaces =
    //    spaces; // Default to true = can contain spaces | false = must not have spaces
    this.min = min; // Minimum characters length
    this.max = max; // Maximum characters length
    this.digits = digits; // Default to 0 | number of digits in password
    this.blacklist = blacklist; // Blacklist passwords
    this.password = password;
  }

  bool validate(password) {
    this.password = password;
    bool uppercase = true,
        min = true,
        max = true,
        digits = true,
        blacklist = true;
    if (this.uppercase != 0) {
      uppercase = _uppercase();
    }
    if (this.min != 0) {
      min = _min();
    }
    if (this.max != 0) {
      max = _max();
    }
    if (this.digits != 0) {
      digits = _digits();
    }
    if (this.blacklist != null) {
      blacklist = _notBlacklisted();
    }

    if (uppercase == true &&
        min == true &&
        max == true &&
        digits == true &&
        blacklist == true) {
      return true;
    }
    return false;
  }

  bool _uppercase() {
    int uppercaseLetters = 0;
    this.password.runes.forEach((int rune) {
      var char = new String.fromCharCode(rune);
      if (int.tryParse(char) == null && char == char.toUpperCase()) {
        uppercaseLetters++;
      }
    });
    if (uppercaseLetters > this.uppercase) {
      return true;
    }
    return false;
  }

  bool _min() {
    if (this.password.length < this.min) {
      return false;
    }
    return true;
  }

  bool _max() {
    if (this.password.length > this.max) {
      return false;
    }
    return true;
  }

  bool _digits() {
    int digits = 0;
    this.password.runes.forEach((int rune) {
      var char = new String.fromCharCode(rune);
      if (int.tryParse(char) != null) {
        digits++;
      }
    });
    if (digits > this.digits) {
      return true;
    }
    return false;
  }

  bool _notBlacklisted() {
    for (var pass in this.blacklist) {
      if (pass == this.password) {
        return false;
      }
    }
    return true;
  }
}
