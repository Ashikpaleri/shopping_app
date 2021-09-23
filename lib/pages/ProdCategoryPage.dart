import 'package:flutter/material.dart';
import 'package:ophone/controllers/JsonConfig.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _readConfigJson = readConfigJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _readConfigJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = [snapshot.data];
            List catList = list[0]['data']['catimages'];
            return GridView.builder(
                itemCount: catList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) {
                  return Image.network(
                    catList[index]['img'],
                    fit: BoxFit.cover,
                  );
                });
          } else {
            return GridView(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
