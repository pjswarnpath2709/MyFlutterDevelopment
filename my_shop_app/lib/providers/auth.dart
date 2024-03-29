// ignore_for_file: avoid_print,prefer_final_fields

import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_shop_app/models/my_exceptions.dart';

class Auth with ChangeNotifier {
  //////+++++++++++++++++++++++++++++++++++++++++//////

  String? _token;

  DateTime? _expiryDate;

  String? _userId;

  Timer? _authTimer;

//////+++++++++++++++++++++++++++++++++++++++++//////

  bool get isAuth {
    return (token != null);
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != '') {
      print(_userId);
      return _token!;
    }
    return null;
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  String? get userId {
    return _userId;
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> _authenticate(
    String email,
    String password,
    String urlSegment,
  ) async {
    //////********************************//////

    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDq7DWmXTUXzNiazKnmfaxAZxPuOS-4Qgg';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      print(json.decode(response.body));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      _autoLogout();
      notifyListeners();

//////********************************//////

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate?.toIso8601String(),
      });
      prefs.setString('userData', userData);

//////********************************//////

    } catch (error) {
      rethrow;
    }
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> signUp(String email, String password) async {
    // signUp
    return _authenticate(email, password, 'signUp');
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  Future<void> logIn(String email, String password) async {
    // signInWithPassword
    return _authenticate(email, password, 'signInWithPassword');
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  void logOut() async {
    _token = null;
    _expiryDate = null;
    _userId = null;
    if (_authTimer != null) {
      _authTimer?.cancel();
    }
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
    notifyListeners();
  }

//////+++++++++++++++++++++++++++++++++++++++++//////

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer?.cancel();
      _authTimer = null;
    }
    final timeToExpiry = _expiryDate?.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry!), logOut);
  }

  //////+++++++++++++++++++++++++++++++++++++++++//////

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, dynamic>;

    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['userId'] as String;
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }
}
