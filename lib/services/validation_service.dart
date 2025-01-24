class ValidationService{
 static String? validateEmail(String value){
    if(value.isEmpty){
      return 'Email is required';
    }
    if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
      return 'Please enter a valid email';
    }
    return null;
  }

 static String? validatePassword(String value){
    if(value.isEmpty){
      return 'Password is required';
    }
    if(value.length < 6){
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}