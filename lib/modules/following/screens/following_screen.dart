import 'package:flutter/material.dart';
import 'package:github_application/modules/user/model/user.dart';
import 'package:github_application/modules/user/providers/user_provider.dart';
import 'package:github_application/utils/services/rest_api_service.dart';
import 'package:provider/provider.dart';

class FollowingScreen extends StatefulWidget {

  FollowingScreen(this.username);

  static const routeName = "/followingScreen";

  String username;


  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {

  User? user;
  List<User>? users;

  @override
  Widget build(BuildContext context) {

    /* setState(() {
      user = Provider.of<UserProvider>(context).getUser();

      ApiService().fetchUser(widget.username);
    }); */

    return Scaffold(
      body: SafeArea(child: Text(widget.username)),
    );
  }
}