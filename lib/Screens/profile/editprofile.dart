import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/profilemodel.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

TextEditingController name = TextEditingController();
TextEditingController bio = TextEditingController();
TextEditingController about = TextEditingController();

class _ProfileEditState extends State<ProfileEdit> {
  Future<ProfileModel> getprofile() async {
    late ProfileModel model;

    var url =
        Uri.parse("https://worksaga.herokuapp.com/api/freelancerauth/getuser");

    var response = await http.post(url, headers: <String, String>{
      "content-type": "application/json",
      "auth-token":
          " eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjIzOGJkZjYxN2FiNzc4ZGU2ODczM2QyIn0sImlhdCI6MTY0Nzg4NTgxNH0.XSy7K-KBTcAbpTwlP3We6wq3319myBoiLm4ESyYIGx4"
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      model = ProfileModel.fromJson(data);
      print(model.id);
    }
    return model;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getprofile(),
        builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
          return Container(
            height: MediaQuery.of(context).size.height / 1.1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.all(15),
                    child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 201, 209, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: TextFormField(
                                controller: name..text = snapshot.data!.name,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ))))),
                Padding(
                    padding: EdgeInsetsDirectional.all(15),
                    child: Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 201, 209, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: TextFormField(
                                controller: bio..text = snapshot.data!.bio,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'bio',
                                  labelText: 'Bio',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ))))),
                Padding(
                    padding: EdgeInsetsDirectional.all(15),
                    child: Container(
                        width: 300,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 201, 209, 233),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: TextFormField(
                                controller: about..text = snapshot.data!.about,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'About',
                                  hintText: 'About',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ))))),
                ElevatedButton(onPressed: () {}, child: Text('Submit'))
              ],
            ),
          );
        });
  }
}
