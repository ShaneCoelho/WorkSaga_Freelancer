import 'package:flutter/material.dart';
import 'LoginPage.dart';
import './splashPage.dart';
import 'LoginPage.dart';
import '../homepage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
          ? false
          : prefs.getBool('isLoggedIn');
      print(isLoggedIn);
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn! ? HomePage() : LoginPage(),
      ));
    }

    main();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashPage(),
    );
  }
}
