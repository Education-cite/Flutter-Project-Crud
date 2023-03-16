import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myproject/AllScreens/resistration.dart';

class loginScreen extends StatelessWidget {
  static const String idScreen = "login";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(
                  height: 1.0,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
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
                        "Login",
                        style: TextStyle(
                            fontSize: 18, fontFamily: "bolt-semibold"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print("User Email : " + emailController.text);
                    print("User password : " + passwordController.text);
                  },
                ),
              ],
            ),
          ),
          TextButton(onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, resistration.idScreen, (route) => false);
          },
              child: Text("Do not have an Account? Register Here")
          )
        ]),
      )),
    );
  }
}
