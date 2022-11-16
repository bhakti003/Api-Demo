import 'dart:convert';

import 'package:demo_api/map_api/Countr/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List userlist = [];
  @override
  void initState() {
    GetApi();
    super.initState();
  }
  GetApi() async {
    var show = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    if(show.statusCode == 200){
   var result = jsonDecode(show.body);
      userlist = result.map((e) => Country.fromJson(e)).toList();
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('County'),centerTitle: true,
      ),
      body: ListView.separated(shrinkWrap: true,
          itemCount: userlist.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(userlist[index].name!.common!),
            leading:Text(userlist[index].flag!.toString()),
            );

      }, separatorBuilder: (context,index){
        return Divider();
    }, )
    );
  }
}
