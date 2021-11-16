import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_application/modules/user/model/user.dart';
import 'package:github_application/utils/services/rest_api_service.dart';

class FollowingScreen extends StatefulWidget {
  FollowingScreen(this.username);

  static const routeName = "/followingScreen";

  String username;

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    ApiService().fetchUser(widget.username).then((data) async {
      user = User.fromJson(json.decode(data.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          user.login,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
