import 'package:errandz/services/validation_service.dart';
import 'package:flutter/material.dart';

class AuthValidationViewModel {
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  final ValueNotifier<String> firstName = ValueNotifier<String>('');
  final ValueNotifier<String> lastName = ValueNotifier<String>('');
  final ValueNotifier<String> phoneNumber = ValueNotifier<String>('');
  final ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  void toggleObscure() {
    obscure.value = !obscure.value;
  }

  String? get emailErrorMessage => ValidationService.validateEmail(email.value);


  bool get isEmailValid =>
      email.value.isNotEmpty &&
      ValidationService.validateEmail(email.value) == null;
  bool get isPasswordValid =>
      password.value.isNotEmpty &&
      ValidationService.validatePassword(password.value) == null;
}
