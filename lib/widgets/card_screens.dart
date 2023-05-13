import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardScreens extends StatefulWidget {
  const CardScreens({super.key});

  @override
  State<CardScreens> createState() => _CardScreensState();
}

class _CardScreensState extends State<CardScreens> {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(viewportFraction: 8.0);
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
    return PageView.builder(
        controller: _pageController, itemBuilder: ((context, index) {}));
  }
}
