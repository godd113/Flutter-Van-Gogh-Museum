import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/screens/search_view.dart';
import 'package:flutter_vangogh_museum/widgets/build_gradient.dart';
import 'package:flutter_vangogh_museum/widgets/card_screens.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  Future<void> clickSearch() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          ViewGradient(
            opacity: 0.8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 3,
                  child: DefaultTextStyle(
                      style: TextStyle(color: Colors.white, fontSize: 50),
                      child: Text(
                        'Vincent van Gogh \nMuseum',
                        textAlign: TextAlign.left,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: CardScreens(),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width - 20,
            height: 50,
            child: IconButton(
              onPressed: clickSearch,
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
