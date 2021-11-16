import 'package:flutter/material.dart';
import 'package:github_application/modules/following/screens/following_screen.dart';
import 'package:github_application/modules/home/screens/home_screen.dart';
import 'package:github_application/modules/user/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create : (context) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "FreeSans",
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          FollowingScreen.routeName : (context) => FollowingScreen(ModalRoute.of(context)!.settings.arguments as String)
        },
      ),
    );
  }
}
