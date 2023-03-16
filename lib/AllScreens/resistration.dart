import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class resistration extends StatelessWidget {
  static const String idScreen = "register";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(
                height: 35.0,
              ),
              Center(
                child: Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/24701-nature-natural-beauty.jpg/1280px-24701-nature-natural-beauty.jpg"),
                  // image: AssetImage("images/logo.png"),

                  width: 390.0,
                  height: 250.0,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Login as a rider",
                style: TextStyle(fontSize: 25, fontFamily: "bolt-semibold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailController,

                      decoration: InputDecoration(labelText: "email"),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "password"),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(labelText: "Username"),
                    ),
                    SizedBox(
                      height: 20,
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
                            "Resister",
                            style: TextStyle(
                                fontSize: 18, fontFamily: "bolt-semibold"),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print("Email : " + emailController.text);
                        print("password : " + passwordController.text);
                        print("User Name: " + usernameController.text);
                        displayToastMessage("Hellow Enamul", context);
                      },
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg:message);
}