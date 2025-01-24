import 'package:flutter/material.dart';

import '../../../../services/validation_service.dart';

class RegisterViewModel extends ChangeNotifier {
  final firstName = ValueNotifier<String>('');
  final lastName = ValueNotifier<String>('');
  final phoneNumber = ValueNotifier<String>('');
  final email = ValueNotifier<String>('');
  final password = ValueNotifier<String>('');

  final firstNameTouch = ValueNotifier<bool>(false);
  final lastNameTouch = ValueNotifier<bool>(false);
  final phoneNumberTouch = ValueNotifier<bool>(false);
  final emailTouch = ValueNotifier<bool>(false);
  final passwordTouch = ValueNotifier<bool>(false);

  bool get firstNameValid =>
      firstNameTouch.value &&
      ValidationService.validateFirstName(firstName.value) == null;
  bool get lastNameValid =>
      lastNameTouch.value &&
      ValidationService.validateLastName(lastName.value) == null;
  bool get phoneNumberValid =>
      phoneNumberTouch.value &&
      ValidationService.validatePhoneNumber(phoneNumber.value) == null;
  bool get emailValid =>
      emailTouch.value && ValidationService.validateEmail(email.value) == null;
  bool get passwordValid =>
      passwordTouch.value &&
      ValidationService.validatePassword(password.value) == null;

  bool get isValid => firstNameValid && lastNameValid && phoneNumberValid && emailValid && passwordValid;
}
