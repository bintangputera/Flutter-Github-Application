import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_application/modules/user/model/user.dart';
import 'package:github_application/utils/services/rest_api_service.dart';

class UserProvider with ChangeNotifier {
  late User user;
  late String errorMessage;
  bool loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);

    await ApiService().fetchUser(username).then((value) {
      setLoading(true);

      if (value.statusCode == 200) {
        setUser(User.fromJson(json.decode(value.body)));
      } else {
        Map<String, dynamic> result = json.decode(value.body);
        setMessage(result['message']);
      }
    });

    return isUser();
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setUser(value) {
    user = value;
    notifyListeners();
  }

  User getUser() {
    return user;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }

  bool isUser() {
    return user != null ? true : false;
  }
}
