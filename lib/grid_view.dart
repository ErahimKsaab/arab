import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_ui/appliance_box.dart';
import 'file:///D:/Compressed/Flutter_Smart_Home_UI_Design-master/Flutter_Smart_Home_UI_Design-master/lib/pages/fan.dart';
import 'package:smart_home_ui/page_one.dart';
import 'package:smart_home_ui/pages/HEATER.dart';
import 'package:smart_home_ui/pages/inside.dart';
import 'package:smart_home_ui/pages/outside.dart';

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<ApplianceBox> items = [
    ApplianceBox(nav:()=> inside(),
      image: SvgPicture.asset('assets/lamp.svg',width: 50,height: 20,),
      title: 'In Side',
      boxInfo: '5 Devices',
    ),
    ApplianceBox(nav:()=> outside(),
      title: 'Out Side',
      image: SvgPicture.asset('assets/lamp.svg',width: 50,height: 20,),
      boxInfo: '2 Devices',
    ),
    ApplianceBox(nav:()=> fan(),
      title: 'Fan',
      image: SvgPicture.asset('assets/fans.svg',width: 50,height: 20,),
      boxInfo: '3 Devices',
    ),
    ApplianceBox(nav:()=> Heater(),
      title: 'Heater',
      boxInfo: '3 Devices',
    ),
  ];
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 20, 18, 18),
      child: StaggeredGridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: items,
        staggeredTiles: [
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 210),
          StaggeredTile.extent(1, 210),
          StaggeredTile.extent(1, 150),
        ],
      ),
    );
  }
}
