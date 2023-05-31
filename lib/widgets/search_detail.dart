import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';

class SearchDetail extends StatelessWidget {
  ModelArtWork oArtWork;
  SearchDetail({super.key, required this.oArtWork});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              width: 80,
              child: Image.asset(oArtWork.imagePath),
            ),
            Text(
              oArtWork.title,
              style: const TextStyle(color: Colors.white),
            )
          ],
        )
      ]),
    );
  }
}
