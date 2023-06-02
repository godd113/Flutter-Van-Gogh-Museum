import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vangogh_museum/models/model_artwork.dart';
import 'package:flutter_vangogh_museum/screens/artwork_detail.dart';
import 'package:flutter_vangogh_museum/widgets/search_detail.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<ModelArtWork> listData = [];
  List<ModelArtWork> searchListData = [];
  TextEditingController controller = TextEditingController(text: "");
  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/jsons/artworks.json');
    final data = await json.decode(response);
    for (var mapData in data) {
      listData.add(ModelArtWork.fromJson(mapData));
    }
    setState(() {
      searchListData = listData;
    });
  }

  Future<void> clickBack() async {}

  Future<void> searchArtWork(String enterKeyword) async {
    List<ModelArtWork> result = [];
    if (enterKeyword.isEmpty) {
      result = listData;
    } else {
      result = listData
          .where(
              (element) => element.title.toLowerCase().contains(enterKeyword))
          .toList();
    }
    setState(() {
      searchListData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.only(top: 44, left: 15),
          child: Row(children: [
            SizedBox(
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
                onChanged: (value) => searchArtWork(value),
                autocorrect: true,
              ),
            ),
            Expanded(flex: 2, child: Container())
          ]),
        ),
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: ListView.builder(
                itemCount: searchListData.length,
                reverse: false,
                itemBuilder: (context, index) {
                  ModelArtWork oArtWork = searchListData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtWorkDetail(
                                    oArtWork: oArtWork,
                                  )));
                    },
                    child: ListTile(
                        title: SearchDetail(
                      oArtWork: oArtWork,
                    )),
                  );
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
