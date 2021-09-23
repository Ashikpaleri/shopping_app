import 'package:flutter/material.dart';
import 'package:ophone/controllers/ProducttDetails.dart';

class TitleBars extends StatefulWidget {
  final Function() buttonAction;
  final int index;

  TitleBars({
    required this.buttonAction,
    required this.index,
  });

  @override
  _TitleBarsState createState() => _TitleBarsState();
}

class _TitleBarsState extends State<TitleBars> {
  @override
  Widget build(BuildContext context) {
    List mobilePhones = listHomePage;
    if (mobilePhones.isNotEmpty) {
      String textInput = mobilePhones[widget.index]["data"]["title"];
      return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textInput.toUpperCase(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: widget.buttonAction,
              child: Text(
                'VIEW ALL',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
  }
}
