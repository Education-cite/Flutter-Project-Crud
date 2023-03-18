
import 'package:flutter/material.dart';
import 'package:myproject/apiCall/service/ApiService.dart';

import '../model/user_model.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  static const String idScreen = "home";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Posts>? _postsModel = [];

  void _getData()async{
    _postsModel = (await ApiService().getPosts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState((){}));
  }

  @override
  void initState(){
    super.initState();
    _getData();
  }

  Widget _getPostList(context){
    return Scaffold(
    appBar: AppBar(
      title: Text("Rest Api Example demo"),

    ),

      body: _postsModel == null || _postsModel!.isEmpty?
          const Center(
            child: CircularProgressIndicator(),
          )
          :Center(
        child: ListView.builder(
          itemCount: _postsModel!.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: FlutterLogo(size: 72.0,),
              title: Text(_postsModel![index].title.toString()),
              subtitle:
              Text(_postsModel![index].title.toString()),
              trailing: IconButton(onPressed: (){
                Navigator.pushAndRemoveUntil<dynamic>(context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => Detail(posts: _postsModel![index]),
                  ),
                      (route) =>false,
                );
              },
              icon: Icon(Icons.more_vert),
              ),
              isThreeLine: true,
            );
          }
        ),
      )

    );
  }


  @override
  Widget build(BuildContext context) {
    return _getPostList(context);
  }
}
