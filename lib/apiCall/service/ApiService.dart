
import 'dart:developer';

import 'package:myproject/apiCall/constants.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/apiCall/model/user_model.dart';

class ApiService{


  Future<List<Posts>?> getPosts() async{
    try{
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.postEndpoint);
      var response = await http.get(url);
      if(response.statusCode==200){
        List<Posts> _model = postsFromJson(response.body);
        return _model;
      }
    }catch(e){
      log(e.toString());
    }
  }


}