
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class Detail extends StatelessWidget {

  final Posts? posts;

  const Detail({Key? key,this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text(
        posts!.title.toString(),
      ),
    ),
  );
  }

}
