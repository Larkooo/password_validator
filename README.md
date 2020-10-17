# password_validator

A password validator package for Dart 

## Getting Started

| Parameters  | Usage       |
| ----------- | ----------------- |
| uppercase   | Integer - Minimum number of uppercase letters      |
| min         | Integer - Minimum password length      |
| max         | Integer - Maximum password length |
| digits      | Integer - Number of digits |
| blacklist   | Blacklisted passwords ex. ["password", "p4ssw0rd"] |

`PasswordValidator passwordValidator = new PasswordValidator(uppercase: 2, min: 6, digits: 5, blacklist: ["password", "mysecretpassword"]);`

`passwordValidator.validate("password"); => will return false since "password is blacklisted and it doesnt have 5 digits"`
