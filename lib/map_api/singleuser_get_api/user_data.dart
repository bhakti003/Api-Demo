import 'dart:convert';

import 'package:demo_api/map_api/singleuser_get_api/single_model.dart';
import 'package:flutter/material.dart';
import '../get_api/get_user_model.dart';
import 'package:http/http.dart'as http;
class UserDatd extends StatefulWidget {
  String? id;
 UserDatd({Key? key,this.id}) : super(key: key);

  @override
  State<UserDatd> createState() => _UserDatdState();
}

class _UserDatdState extends State<UserDatd> {
Singleuser? singleuser=Singleuser();


  @override
  void initState() {
    getSingleUser();
    super.initState();
  }
  getSingleUser() async {
    print('Call SingleUser');
    var response = await http.get(Uri.parse("https://reqres.in/api/users/${widget.id!}"));
    if (response.statusCode == 200) {
      print("Response${response.body}");
      singleuser = Singleuser.fromJson(jsonDecode(response.body));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Singleuser'),
      ),
      body: singleuser!.data ==null
      ?Center(child: CircularProgressIndicator())
            :Column(
        children: [
          Text(singleuser!.data!.id!.toString()),
          Text(singleuser!.data!.email!),
          Text(singleuser!.data!.firstName!),
          Text(singleuser!.data!.lastName!),
        ],
      ),

    );
  }
}
