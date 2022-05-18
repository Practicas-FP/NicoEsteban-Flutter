import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/utils/custom_text_normal.dart';


class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watchlist")
      ),
      body: Container(
        height: 250,
        child: custom_text_bold(text: "Hello!",size: 14 ,color: Colors.amber ),
      ),
    );
  }
}
