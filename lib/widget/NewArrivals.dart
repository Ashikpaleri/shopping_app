import 'package:flutter/material.dart';
import 'package:ophone/controllers/ProducttDetails.dart';
import 'package:ophone/pages/ProdPage.dart';

class NewArrivals extends StatefulWidget {
  @override
  _NewArrivalsState createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
  @override
  Widget build(BuildContext context) {
    List mobilePhones = listHomePage;
    if (mobilePhones.isNotEmpty) {
      List items = mobilePhones[4]['data']['items'];
      return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => ProductPage(),
                  ),
                );
              },
              child: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 500,
                  color: Colors.white,
                  child: Stack(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              items[index]['image'],
                              height: 80,
                            ),
                            Text(items[index]['name'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[600])),
                            Text(
                              'OMR ${items[index]['price'].toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    items[index]['storage'] != false
                        ? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.brown,
                        child: Text(
                          items[index]['storage'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        : SizedBox(),
                  ])),
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
  }
}
