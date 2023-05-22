import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';
import 'package:flutter_vangogh_museum/widgets/build_gradient.dart';

class CardView extends StatefulWidget {
  ModelArtWork oArtWork;
  CardView({super.key, required this.oArtWork});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  Widget _buildimageView() {
    return Positioned.fill(
        //- ทำให้ element ที่อยู่ใน tag นี้เต็มพื้นที่
        child: Image.asset(
      widget.oArtWork.imagePath,
      fit: BoxFit.cover,
    ));
  }

  Widget _buildLabel() {
    return Container(
        padding: EdgeInsets.only(
            left: 10, top: MediaQuery.of(context).size.height * 0.20 / 2 + 10),
        child: Text(
          '${widget.oArtWork.title}\n${widget.oArtWork.subTitle}',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w100, fontSize: 19),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(children: [
          _buildimageView(),
          ViewGradient(
            opacity: 0.9,
          ),
          _buildLabel()
        ]),
      ),
    );
  }
}
