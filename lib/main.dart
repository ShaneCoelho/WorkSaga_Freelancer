import 'package:flutter/material.dart';
// import './Screens/homepage.dart';
import './Screens/startup_screen/splash.dart';
import './Widgets/userbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Work Saga',
        home: SplashScreen(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Color(0xFF182A42),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ));
  }
}
