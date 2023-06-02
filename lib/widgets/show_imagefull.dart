import 'package:flutter/material.dart';

class ShowImageFullScreen extends StatelessWidget {
  String imagePath = "";
  ShowImageFullScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Future<void> clickBack() async {
      Navigator.pop(context);
    }

    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: const SizedBox(
                    height: 60,
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => clickBack(),
                )),
          ),
          Center(
            child: InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
