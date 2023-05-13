import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';
import 'package:flutter_vangogh_museum/widgets/card_view.dart';

class CardScreens extends StatefulWidget {
  const CardScreens({super.key});

  @override
  State<CardScreens> createState() => _CardScreensState();
}

class _CardScreensState extends State<CardScreens> {
  late PageController _pageController;
  List<ModelArtWork> gallary = [
    ModelArtWork(
        'The Starry night',
        'Year 1889',
        'The Starry Night is an oil-on-canvas painting by the Dutch Post-Impressionist painter Vincent van Gogh. Painted in June 1889, it depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence, just before sunrise, with the addition of an imaginary village',
        'assets/imgs/artworks/the-starry-night.jpeg'),
    ModelArtWork(
        'The Night cafe',
        'Year 1888',
        'The painting was executed on industrial primed canvas of size 30 (French standard). It depicts the interior of the cafe, with a half-curtained doorway in the center background leading, presumably, to more private quarters. Five customers sit at tables along the walls to the left and right, with Ginoux, the landlord said to be depicted (standing) in it, to one side of a billiard table near the center of the room, facing the viewer.\nThe five customers depicted in the scene have been described as "three drunks and derelicts in a large public room huddled down in sleep or stupor." One scholar wrote, "The cafe was an all-night haunt of local down-and-outs and prostitutes, who are depicted slouched at tables and drinking together at the far end of the room."\nIn wildly contrasting, vivid colours, the ceiling is green, the upper walls red, the glowing, gas ceiling lamps and floor largely yellow. The paint is applied thickly, with many of the lines of the room leading toward the door in the back. The perspective looks somewhat downward toward the floor.',
        'assets/imgs/artworks/the_night_cafe.jpeg'),
    ModelArtWork(
        'The Potato Eater',
        'Year 1885–1885',
        'The Potato Eaters is an oil painting by Dutch artist Vincent van Gogh painted in April 1885 in Nuenen, Netherlands. It is in the Van Gogh Museum in Amsterdam.',
        'assets/imgs/artworks/the_potato_eater.png')
  ];
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(viewportFraction: 0.687);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: gallary.length,
                  itemBuilder: ((context, index) {
                    return CardView(oArtWork: gallary[index]);
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
