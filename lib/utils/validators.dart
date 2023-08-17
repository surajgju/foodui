extension TextValidators on String {

  bool isValidEmail() => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(trim());

  bool isValidPhoneNumber() {
    String regexPattern = r'^[6-9]\d{9}$';
    var regExp = RegExp(regexPattern);
    if (trim().isEmpty) {
      return false;
    } else if (regExp.hasMatch(trim())) {
      return true;
    }
    return false;
  }
  bool isValidInteger(){
    String regexPattern = r'^\d+$';
    var regExp = RegExp(regexPattern);
    if(trim().isEmpty){
      return false;
    }else if(regExp.hasMatch(trim())){
      return true;
    }
    return false;
  }
  bool isValidPassword(){
    if(trim().isEmpty){
      return false;
    }else if(trim().length > 4){
      return true;
    }
    return false;
  }
  //isValidNumber
}
