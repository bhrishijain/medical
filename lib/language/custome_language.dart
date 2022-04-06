import 'package:get/get.dart';
import 'package:medical/language/arabic.dart';
import 'package:medical/language/english.dart';

class CustomLanguage extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
    'en_US' : English.enLang,
    'ar_SA' : Arabic.arLang,
  };

}