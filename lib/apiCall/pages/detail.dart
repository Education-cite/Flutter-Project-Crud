
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/apiCall/service/ApiService.dart';

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
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(

                 "Id : " +posts!.body.toString()
                ),

                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "delete",
                        style: TextStyle(
                            fontSize: 18, fontFamily: "bolt-semibold"),
                      ),
                    ),
                  ),
                  onPressed: () async{
                    (await ApiService().deletePosts (posts!.id));
                    displayToastMessage("deleted Successfully", context);
                  },
                ),
              ],
            ),

          ],
        ),
      )
  );
  }

}
displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg:message);
}