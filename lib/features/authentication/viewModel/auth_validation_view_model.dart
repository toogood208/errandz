import 'package:errandz/services/validation_service.dart';
import 'package:flutter/material.dart';

class AuthValidationViewModel  {
  final ValueNotifier<String> email = ValueNotifier<String>('');
  final ValueNotifier<String> password = ValueNotifier<String>('');
  final ValueNotifier<bool> obscure = ValueNotifier<bool>(true);

  void toggleObscure() {
    obscure.value = !obscure.value;
  }

  bool get isEmailValid => email.value.isNotEmpty && ValidationService.validateEmail(email.value) == null;
  bool get isPasswordValid => password.value.isNotEmpty &&  ValidationService.validatePassword(password.value) == null;


}