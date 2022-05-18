import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/utils/custom_text_normal.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User profile")
      ),
      body: Container(
        height: 250,
        child: custom_text_bold(text: "Profile Page(not in use already)!",size: 14 ,color: Colors.amber ),
      ),
    );
  }
}
