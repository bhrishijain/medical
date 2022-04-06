import 'dart:convert';
import 'package:http/http.dart' as http;
import 'apis.dart';



class RegistrationService {




  Future<void> registration({name,email,phone}) async {
    final  _body = {
    'name': name,
    'email': email,
    'password' : '123456',
    'phone': phone,
    'profile_type' : '1',
    'token' : 'qwert',
    'type' : '1',
    };


    var response = await http.post(Uri.parse(REGISTER_API),
        body: _body
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if(data['status'] == 1){
        //successfully register can navigate to home
      }else{
        //getting some error

        print(data['msg']);

      }
      return data;
      print(response.body);
    }
    else {
      print('error');
    }
  }


}

