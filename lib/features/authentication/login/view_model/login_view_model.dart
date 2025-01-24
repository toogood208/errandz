import 'package:errandz/features/authentication/viewModel/auth_validation_view_model.dart';

class LoginViewModel extends AuthValidationViewModel{
  bool get isValid => email.value.isNotEmpty && password.value.isNotEmpty;
}