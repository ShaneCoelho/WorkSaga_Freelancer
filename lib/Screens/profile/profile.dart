import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:http/http.dart' as http;
import '../../Widgets/appbar.dart';
import '../../models/profilemodel.dart';
import 'editprofile.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String name;
  late PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getprofile();
    super.initState();
  }

  Future<ProfileModel> getprofile() async {
    late ProfileModel model;

    var url =
        Uri.parse("https://worksaga.onrender.com/api/freelancerauth/getuser");

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
    // Size get; preferredSize => const Size.fromHeight(100);
    return Scaffold(
      // appBar: AppBarWidget();
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: getprofile(),
            builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Lottie.network(
                        'https://assets4.lottiefiles.com/packages/lf20_vxy0klrn.json'),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('error');
              }
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  // decoration: BoxDecoration(
                  //   color: Color(0xFFEEEEEE),
                  // ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: Stack(
                            children: [
                              Image.network(
                                'https://picsum.photos/seed/316/600',
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.74, 0.67),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    snapshot.data!.Avatar,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.36, 0.77),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_sharp,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    showMaterialModalBottomSheet(
                                      context: context,
                                      builder: (context) => Container(
                                        height: 300,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.94, 1.30),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => ProfileEdit());
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, -0.21),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color.fromARGB(255, 90, 90, 90),
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    // showMaterialModalBottomSheet(
                                    //     context: context,
                                    //     builder: (context) => ());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 0, 0, 0),
                                    child: Text(
                                      snapshot.data!.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          33, 5, 23, 0),
                                      child: Text(
                                        snapshot.data!.bio,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 11, 0, 0),
                                    child: Text(
                                      'Mumbai, Maharashtra, India',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 146,
                                      height: 26,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        child: Text(
                                          'Open to',
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 146,
                                      height: 26,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        child: Text(
                                          'Open to',
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 15,
                          thickness: 15,
                          color: Color(0xFFE5E5E5),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          33, 0, 0, 0),
                                      child: Text(
                                        'About',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          33, 0, 23, 0),
                                      child: Text(
                                        snapshot.data!.about,
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 15,
                          thickness: 15,
                          color: Color(0xFFE5E5E5),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 10, 0, 10),
                                    child: Text(
                                      'Cost',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(33, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text('\$2000')],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 15,
                          thickness: 15,
                          color: Color(0xFFE5E5E5),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 10, 0, 10),
                                    child: Text(
                                      'Experiences',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        31, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/380/600',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21, 0, 0, 0),
                                            child: Text(
                                              snapshot
                                                  .data!.experience[0].title,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21, 0, 0, 0),
                                            child: Text(
                                              snapshot.data!.experience[0]
                                                  .description,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 49),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        31, 0, 0, 0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/630/600',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21, 0, 0, 0),
                                            child: Text(
                                              'Marketing Executive',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21, 0, 0, 0),
                                            child: Text(
                                              'Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry.',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 15,
                          thickness: 15,
                          color: Color(0xFFE5E5E5),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        33, 10, 0, 10),
                                    child: Text(
                                      'CV & Certifications',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 500,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 50),
                                      child: PageView(
                                        controller: pageViewController =
                                            PageController(initialPage: 0),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Image.network(
                                            'https://picsum.photos/seed/266/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            'https://picsum.photos/seed/706/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.network(
                                            'https://picsum.photos/seed/364/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: SmoothPageIndicator(
                                          controller: pageViewController =
                                              PageController(initialPage: 0),
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            pageViewController.animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: ExpandingDotsEffect(
                                            expansionFactor: 2,
                                            spacing: 5,
                                            radius: 12,
                                            dotWidth: 6,
                                            dotHeight: 6,
                                            dotColor: Color(0xFF9E9E9E),
                                            activeDotColor: Color(0xFF3F51B5),
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
