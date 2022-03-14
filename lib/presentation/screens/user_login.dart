import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery_dubai/constants/colors.dart';
import 'package:grocery_dubai/constants/strings.dart';
import 'package:grocery_dubai/data/models/user_model.dart';
import 'package:grocery_dubai/data/web_services/user_api.dart';
import 'package:grocery_dubai/presentation/screens/user_details.dart';
import '../widgets/button_widget.dart';
import '../widgets/textField_widget.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final UserLogin _loginService = UserLogin();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  logo,
                  width: MediaQuery.of(context).size.width / 1.8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFieldWidget(email, _emailController),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 60),
              child: TextFieldWidget(password, _passwordController),
            ),
            ButtonWidget(
              'Log in',
              FontAwesomeIcons.angleRight,
              MyColors.myBlack,
              () async {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  UserModel? user = await _loginService.login(
                      _emailController.text, _passwordController.text);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => UserDetailsScreen(
                          user: user,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('Email or password incorrect'),
                      ),
                    );
                    return null;
                  }
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Divider(),
            ),
            ButtonWidget('Continue with Google', FontAwesomeIcons.google,
                MyColors.grassGreen, () async {
              UserModel? user = await _loginService.googleSignIn(context);
              if (user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => UserDetailsScreen(
                      user: user,
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
