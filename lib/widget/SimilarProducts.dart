import 'package:flutter/material.dart';
import 'package:ophone/controllers/ProducttDetails.dart';
import 'package:ophone/controllers/similarJson.dart';

class SimilarProducts extends StatelessWidget {
  final _readSimilarJson = readSimilarJson();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _readSimilarJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> map = snapshot.data as Map<String, dynamic>;
            List list = map['items'];
            String currency = map['currency'];
            return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: list.length,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 190,
                              child: Image.network(similarImageLinks[index])),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  list[index]['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      currency,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[700]),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${list[index]['price'].toStringAsFixed(2)}',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[700]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      list[index]['storage'] != false
                          ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          color: Colors.brown,
                          child: Text(
                            list[index]['storage'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),
                    ]),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
