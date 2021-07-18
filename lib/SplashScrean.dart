

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_home_ui/page_one.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class SplashScrean extends StatefulWidget {
  @override
  _SplashScreanState createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {
  @override
  var wifiIP, wifiName;
  asd()async{
    wifiIP = await WifiInfo().getWifiIP();
    wifiName = await WifiInfo().getWifiName();
    print(wifiIP);
    print(wifiName);
  }

  void initState() {
    asd();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        Future.delayed(
          Duration(seconds: 4),
          () => Navigator.of(context, rootNavigator: false).pushReplacement(
            MaterialPageRoute(
              builder: (context) => PageOne(),
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Color(0xff202227),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                width:200,
                height:250,
                child: Lottie.asset('assets/smart-home.json',
                    height: hight / 3, width: width, fit: BoxFit.fill)),


          ],
        ));
  }
}
