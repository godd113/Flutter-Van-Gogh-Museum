import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';
import 'package:flutter_vangogh_museum/widgets/search_detail.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ModelArtWork> listData = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/artworks.json');
    final data = await json.decode(response);
    setState(() {
      for (var mapData in data) {
        listData.add(ModelArtWork.fromJson(mapData));
      }
    });
  }

  Future<void> clickBack() async {}

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: "");
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            padding: const EdgeInsets.only(top: 44, left: 15),
            child: Row(children: [
              Container(
                width: 30,
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
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 55,
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                  controller: controller,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  autocorrect: true,
                ),
              ),
              Expanded(flex: 2, child: Container())
            ]),
          ),
        ),
        Expanded(
          flex: 7,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: ListView.builder(
                itemCount: listData.length,
                reverse: false,
                itemBuilder: (context, index) {
                  ModelArtWork oArtWork = listData[index];
                  return ListTile(
                      title: SearchDetail(
                    oArtWork: oArtWork,
                  ));
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
