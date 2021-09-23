import 'package:flutter/material.dart';
import 'package:ophone/widget/Banner.dart';
import 'package:ophone/widget/FeaturedItems.dart';
import 'package:ophone/widget/MobilePhone.dart';
import 'package:ophone/widget/NewArrivals.dart';
import 'package:ophone/widget/ProdOffers.dart';
import 'package:ophone/widget/TestProducts.dart';
import 'package:ophone/widget/TitleBar.dart';
import 'package:ophone/widget/Slider.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          HomeSlider(),
          TitleBars(buttonAction: () {}, index: 0),
          MobilePhones(),
          TitleBars(buttonAction: () {}, index: 1),
          TestProducts(),
          TitleBars(buttonAction: () {}, index: 2),
          FeaturedItems(),
          CustomBanner(),
          TitleBars(buttonAction: () {}, index: 4),
          NewArrivals(),
          TitleBars(buttonAction: () {}, index: 5),
          Offers(),
        ],
      ),
    );
  }
}
