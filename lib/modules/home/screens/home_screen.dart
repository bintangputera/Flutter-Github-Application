import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_application/modules/following/screens/following_screen.dart';
import 'package:github_application/modules/user/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final UserProvider userProvider;

  bool _validate = false;

  TextEditingController _controller = TextEditingController();

  void _getUser() {
    if (_controller.text.isEmpty) {
      userProvider.setMessage('Please Enter Your Username');
      setState(() {
        _validate = false;
      });
    } else {
      userProvider.fetchUser(_controller.text).then((value) {
        if (value) {
          // Navigator.pushNamed(context, FollowingScreen.routeName, arguments: _controller.text);
        }
      });
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(child: _buildContent());
  }

  Widget _buildContent() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://cdn3.iconfinder.com/data/icons/inficons/512/github.png'),
            ),
            Text(
              "Github",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.1)),
              child: TextField(
                onChanged: (value) {
                  userProvider.setMessage("");
                },
                controller: _controller,
                enabled: !userProvider.isLoading(),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Github username",
                  errorText: _validate ? "Enter your username" : null,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                _getUser();
              },
              padding: EdgeInsetsDirectional.all(20),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                child: userProvider.isLoading()
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        "Get your profile detail",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
            Text(
              _validate.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
