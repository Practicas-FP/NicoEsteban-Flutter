import 'package:flutter/material.dart';
import 'package:movies_app_flutter/utils/custom_text_bold.dart';
import 'package:movies_app_flutter/utils/custom_text_normal.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Search")
      ),
      body: Container(
        height: 250,
        child: custom_text_bold(text: "This will be Search Page!",size: 14 ,color: Colors.amber ),
      ),
    );
  }
}
