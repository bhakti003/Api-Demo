import 'dart:convert';

import 'package:demo_api/map_api/get_api/get_user_model.dart';
import 'package:demo_api/map_api/singleuser_get_api/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  GetUsermodel? model=GetUsermodel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  getApi() async {
    print('calling Api');
    var result =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (result.statusCode == 200) {
      print("Result${result.body}");
      model = GetUsermodel.fromJson(jsonDecode(result.body));
      //  return model;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      model!.userList == null ?Center(child: CircularProgressIndicator())
          :ListView.separated(
              itemCount: model!.userList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDatd(id:model!.userList![index].id!.toString() ),
                        ));
                    setState(() {

                    });
                  },
                  child: Column(
                    children: [
                      Text(model!.userList![index].id.toString()),
                      Text(model!.userList![index].email!),
                      Text(model!.userList![index].firstName!),
                      Text(model!.userList![index].lastName!),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 3,
                );
              },
            ),
    );
  }
}
// import 'dart:convert';
//
// import 'package:demo_api/map_api/get_api/get_user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class First extends StatefulWidget {
//   const First({Key? key}) : super(key: key);
//
//   @override
//   State<First> createState() => _FirstState();
// }
//
// class _FirstState extends State<First> {
//   Getuser? model = Getuser();
//
//   @override
//   void initState() {
//     getApi();
//     super.initState();
//   }
//
//   getApi() async {
//     print("Calling");
//     var response =
//         await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
//     if (response.statusCode == 200) {
//       print("Response${response.body}");
//       model = Getuser.fromJson(jsonDecode(response.body));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Api"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 500,
//             color: Colors.blueGrey.withOpacity(0.2),
//             child: model!.userList == null
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.separated(
//                     itemCount: model!.userList!.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 100,
//                         color: Colors.black54,
//                         child: Column(
//                           children: [
//                             Text(model!.userList![index].id.toString()),
//                             Text(model!.userList![index].email!),
//                             Text(model!.userList![index].firstName!),
//                             Text(model!.userList![index].lastName!),
//                           ],
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(
//                         height: 2,
//                       );
//                     },
//                   ),
//           )
//         ],
//       ),
//     );
//   }
// }
