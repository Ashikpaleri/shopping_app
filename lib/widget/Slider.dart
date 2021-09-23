import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ophone/controllers/JsonConfig.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final _readConfigJson = readConfigJson();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _readConfigJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> map = snapshot.data as Map<String, dynamic>;
            List list = map['data']['slider'];
            return CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (context, index, hero) {
                return Image.network(
                  list[index]['image'],
                );
              },
              options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 16 / 9),
            );
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
        });
  }
}
