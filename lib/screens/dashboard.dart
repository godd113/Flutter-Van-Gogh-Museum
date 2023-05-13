import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imgs/artworks/vangogh.jpeg'),
                  fit: BoxFit.fitHeight)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 50),
                  child: Text(
                    'Vincent van Gogh',
                    textAlign: TextAlign.left,
                  )),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const DefaultTextStyle(
                    style: TextStyle(color: Colors.white, fontSize: 38),
                    child: Text('Museum')),
              )
            ],
          ),
        )
      ]),
    );
  }
}
