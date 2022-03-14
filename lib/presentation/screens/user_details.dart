
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_dubai/constants/colors.dart';
import 'package:grocery_dubai/presentation/widgets/text_widget.dart';
import '../../data/models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  UserModel user;
  UserDetailsScreen({Key? key ,required this.user}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState(user);
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final UserModel user;
  _UserDetailsScreenState(this.user);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.myWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
              user.email,15 , MyColors.myBlack ,'Comforta'
          ),
          TextWidget(
              user.token,15 , MyColors.grassGreen ,'Comforta'
          ),
        ],
      ),
    );
  }
}
