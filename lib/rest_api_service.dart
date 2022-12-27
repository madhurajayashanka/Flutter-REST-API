import 'dart:convert';

import 'package:untitled2/user.dart';
import 'package:http/http.dart' as http;

class RestAPIService{
  String apiURL='https://mocki.io/v1/ed0c6388-7a27-4c27-942b-f1b6b358178e';

  Future<List<User>> getUsers() async{
    final response = await http.get(Uri.parse(apiURL));
    if(response.statusCode==200){
     return getUserList(response.body);
    }else{
      throw Exception("Unable to fetch data");
    }
  }

  List<User> getUserList(String responseBody){
    final parsedBody = json.decode(responseBody).cast<Map<String,dynamic>>();
    return parsedBody.map<User>((json)=>User.fromJson(json)).toList();
  }
}