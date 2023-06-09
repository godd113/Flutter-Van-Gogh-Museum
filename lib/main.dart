import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/screens/dashboard.dart';
import 'package:flutter_vangogh_museum/widgets/card_screens.dart';
import 'package:flutter_vangogh_museum/widgets/show_imagefull.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case "/":
              return MaterialPageRoute(
                  builder: (context) => const MyDashboard());
            case "/fullscreenimage":
              return MaterialPageRoute(
                  builder: (context) => ShowImageFullScreen(
                        imagePath: "",
                      ),
                  fullscreenDialog: true);
          }
        });
  }
}
