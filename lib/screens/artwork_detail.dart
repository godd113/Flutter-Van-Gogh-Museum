import 'package:flutter/material.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';
import 'package:flutter_vangogh_museum/widgets/build_gradient.dart';
import 'package:flutter_vangogh_museum/widgets/show_imagefull.dart';

class ArtWorkDetail extends StatelessWidget {
  ModelArtWork oArtWork;
  ArtWorkDetail({super.key, required this.oArtWork});

  Widget _buildimageView() {
    return Positioned.fill(
        //- ทำให้ element ที่อยู่ใน tag นี้เต็มพื้นที่
        child: Image.asset(
      oArtWork.imagePath,
      fit: BoxFit.cover,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future<void> clickFullScreenImage() async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowImageFullScreen(
                    imagePath: oArtWork.imagePath,
                  ),
              fullscreenDialog: true));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        GestureDetector(
          onTap: () => clickFullScreenImage(),
          child: SizedBox(
              height: (size.height / 2),
              child: Stack(children: [
                _buildimageView(),
                ViewGradient(
                  opacity: 0.6,
                ),
              ])),
        ),
        Container(
          padding: const EdgeInsets.only(top: 65, left: 15),
          child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              )),
        ),
        Column(
          children: [
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(34)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            height: 5,
                            width: 32 * 1.5,
                            decoration: BoxDecoration(
                                gradient: const RadialGradient(
                                    colors: [Colors.white, Colors.white]),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            oArtWork.title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 19),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 2, left: 10),
                          child: Text(
                            oArtWork.subTitle,
                            style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 15),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            oArtWork.detail,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
