import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:classified_ads/exceptions/exceptions.dart';
import 'package:classified_ads/utilities/api_helper.dart';
import 'package:classified_ads/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Authentication {
  Map<String, String> headers = {'Accept': 'application/json'};

  var status;

  Future<User> register(
      String first_name , String last_name,
      String email , String mobile ,
      String password ,
      String file_path , String file_name ,

    ) async {
    FormData body =
         new FormData.fromMap({
           "first_name" : first_name,
           'last_name': last_name,
           'email': email,
           'mobile' : mobile,
           'password': password,
           "photo_url": await MultipartFile.fromFile(file_path, filename:file_name),
         });


    Response response = await Dio().post(
      ApiHelper.AUTH_REGISTER,
      data: body,
    );

     status = response.statusCode ;


    switch (response.statusCode) {
      case 201:

        var body = response.data;
        //var data = body['data'];
        print(body);
        print('\n');
        _save(body["api_token"]);
        print("api token :  " + body["api_token"] + " was saved successfully");
        print('\n');


        return null;
        break;

      case 422:
        throw MissingFields();
        break;
      case 500:
        throw LoginField('Sign Up Field');
        break;
      default:
        return null;
        break;
    }
  }

  Future<User> login(String email, String password) async {
    Map<String, String> body = {'email': email, 'password': password};
    http.Response response = await http.post(
      ApiHelper.AUTH_LOGIN,
      headers: headers,
      body: body,
    );
    status = response.body.contains('error');
    var data = json.decode(response.body);
    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["api_token"]}');
    }

    switch (response.statusCode) {
      case 200:
        var body = convert.jsonDecode(response.body);
        var data = body['data'];
        print(response.statusCode);
        print(data);
        _save(data["api_token"]);

        return User.fromJson(data);
        break;

      case 401:
        throw LoginField('Credentials Rejected');
        break;

      default:
        return null;
        break;
    }
  }

  _save(String api_token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = api_token;
    prefs.setString(key, value);
    
  }

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'api_token';
    final value = prefs.get(key) ?? null;
    print('read : $value');
  }
}
