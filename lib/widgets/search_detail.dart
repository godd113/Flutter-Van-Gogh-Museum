import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';

class SearchDetail extends StatelessWidget {
  ModelArtWork oArtWork;
  SearchDetail({super.key, required this.oArtWork});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 70,
            height: 60,
            child: SizedBox(
                child: Image.asset(
              oArtWork.imagePath,
              fit: BoxFit.cover,
            )),
          ),
          Text(
            oArtWork.title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      )
    ]);
  }
}
