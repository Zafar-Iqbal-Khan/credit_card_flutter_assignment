import 'dart:convert';
import 'dart:io';

import 'package:credit_card/joinUs/register.dart';
import 'package:credit_card/models/get_cards_model.dart';
import 'package:credit_card/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Apimanager {
  // String url = "https://flutter-assignment-api.herokuapp.com/v1/auth/register";

  Future<RegisterUser> registerUser(
      {String? name, String? email, String? password}) async {
    var response = await http.post(
      Uri.parse(
          "https://flutter-assignment-api.herokuapp.com/v1/auth/register/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "name": name!,
          "email": email!,
          "password": password!,
        },
      ),
    );
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 400) {
      print(response.body);
      return registerFromJson(response.body);
    } else {
      throw ('cannot process the request');
    }
  }

  Future<RegisterUser> loginUser({String? email, String? password}) async {
    var response = await http.post(
      Uri.parse("https://flutter-assignment-api.herokuapp.com/v1/auth/login/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "email": email!,
          "password": password!,
        },
      ),
    );
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 400) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var responseJson = json.decode(response.body);
      var tokenId = responseJson['tokens'];
      var toke = tokenId['access'];
      await prefs.setString('token', toke['token']);
      return registerFromJson(response.body);
    } else {
      throw ('cannot process the request');
    }
  }

  Future<GetCards> getCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tok = prefs.getString('token');
    var response = await http.get(
      Uri.parse("https://flutter-assignment-api.herokuapp.com/v1/cards/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $tok '
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 400) {
      return getCardsFromJson(response.body);
      print(response.body);
    } else {
      throw ('cannot process the request');
    }
  }

  void addCard({
    String? name,
    String? cardHolder,
    String? cardExpiration,
    String? cardNumber,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tok = prefs.getString('token');

    var response = await http.post(
      Uri.parse("https://flutter-assignment-api.herokuapp.com/v1/cards/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $tok '
      },
      body: jsonEncode(
        <String, String>{
          "name": name!,
          "cardExpiration": cardExpiration!,
          "cardHolder": cardHolder!,
          "cardNumber": cardNumber!,
          "category": "VISA"
        },
      ),
    );
    print(response.statusCode);

    if (response.statusCode == 201 || response.statusCode == 400) {
      print(response.body);
    } else {
      throw ('cannot process the request');
    }
  }

  void logOutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var response = await http.post(
      Uri.parse("https://flutter-assignment-api.herokuapp.com/v1/auth/logout/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{"refreshToken": token!},
      ),
    );
  }
}
