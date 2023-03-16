
//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';


class mainScreen extends StatelessWidget {
  static const String idScreen = "mainscreen";
  final TextEditingController usernameController = TextEditingController();


  _buildList(QuerySnapshot qs){
    return ListView.builder(itemCount: qs.docs.length,
        itemBuilder: (context,index){
          final DocumentSnapshot map = qs.docs[index];
          return ListTile(
            title: Text(map["title"]),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("main screen"),
     ),
     body: Padding(
       padding: EdgeInsets.all(8.0),
       child: Column(
         children: [
           Row(
             children: [
               Expanded(child: TextField(
                 controller: usernameController,
                 decoration: InputDecoration(),
                 style: TextStyle(fontSize: 14.0),
               )
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
                       "Add",
                       style: TextStyle(
                           fontSize: 18, fontFamily: "bolt-semibold"),
                     ),
                   ),
                 ),
                 onPressed: () {
                   FirebaseFirestore.instance
                   .collection("employee")
                   .add({"title":usernameController.text});
                   usernameController.text = "";
                   print("User Name: " + usernameController.text);

                   displayToastMessage("Added Successfully", context);
                 },
               ),
             ],
           ),
           StreamBuilder<QuerySnapshot>(
             stream:FirebaseFirestore.instance.collection("employee").snapshots(),
             builder:(context,snapshot){
               if(!snapshot.hasData){
                 return LinearProgressIndicator();
               }else {
                 return Expanded(
                   child: _buildList(snapshot.data!),
                 );
               };
             }
           )
         ],
       ),
     ),
   );
  }
}

displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg:message);
}

