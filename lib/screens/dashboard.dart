import 'package:audioplayers/audioplayers.dart';
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
  bool isSoundON = true;
  Future<void> clickSearch() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SearchView()));
  }

  @override
  Widget build(BuildContext context) {
    AudioCache _audioCache = AudioCache(
      prefix: 'audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );

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
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const DefaultTextStyle(
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          child: Text(
                            'Vincent van Gogh \nMuseum',
                            textAlign: TextAlign.left,
                          )),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: Icon(
                            isSoundON
                                ? Icons.volume_off
                                : Icons.volume_up_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            isSoundON = !isSoundON;
                          });
                          //_audioCache.play('one-last-time.mp3');
                        },
                      )
                    ],
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: CardScreens(),
                  ),
                ),
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
