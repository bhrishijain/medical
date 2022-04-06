import 'dart:convert';

import 'package:http/http.dart' as http ;

import '../model/ProfileType.dart';
import 'apis.dart';

class SelectProfile {

  List<ProfileType> profileList = [];

  Future getProfile() async {
    final res = await http.get(Uri.parse(SELECT_PROFILE_API));
    if (res.statusCode == 200) {
      print('api hit successfull');
      var data = jsonDecode(res.body);
      if (data['status'] == 1) {
        print(data['msg']);
        Iterable _list = data['data'];
        print(_list);
        profileList = _list.map((e) => ProfileType.fromJson(e)).toList();
      }
      else {
        print('error');
      }
    }
  }
}





