import 'dart:convert';

import 'package:demo_api/map_api/post_api/post_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostFirstPage extends StatefulWidget {
  const PostFirstPage({Key? key}) : super(key: key);

  @override
  State<PostFirstPage> createState() => _PostFirstPageState();
}

class _PostFirstPageState extends State<PostFirstPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Postuser? model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  postApi() async {
    print('Call');
    var result = await http.post(Uri.parse("https://reqres.in/api/users"),body: {
      "name":nameController.text,
      "job" :emailController.text
    });
    print(result.body);
    if(result == 200){
      print("Response${result.body}");}
    model = Postuser.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Api'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: nameController,),
            TextField(controller: emailController,),
            SizedBox(height: 5,),
            GestureDetector(onTap: (){
              postApi();
            },
                child: Container(height: 40,width: 80,color: Colors.blueGrey,child: Center(child: Text('Login')),))
          ],
        ),
      ),


    );
  }
}
