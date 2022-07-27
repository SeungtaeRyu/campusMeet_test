import 'package:flutter/cupertino.dart';

class CheckValidate{
  String? validatePassword(String value){
    if (value != null || value.isNotEmpty) {
      final RegExp regex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?~^<>,.&+=])[A-Za-z\d@$!%*#?~^<>,.&+=]{8,20}$');
    //         r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?~^<>,.&+=])[A-Za-z\d@$!%*#?~^<>,.&+=]{8,20}$'
      // 정규 표현식 참고 자료
      //https://support.cognex.com/docs/vidi_341/web/KO/vidisuite/Content/ViDi_Topics/1_Overview/images_display_filters_regex_basics.htm
      if (!regex.hasMatch(value!))
        return '영문, 특수문자,숫자 포함 8자 이상 20자 이내로 입력하세요.';
      else
        return null;
    } else {
      return '비밀번호를 입력하세요.';
    }
  }


}