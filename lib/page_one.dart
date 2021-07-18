import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_ui/custom_nav_bar.dart';
import 'package:smart_home_ui/grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  StreamController _relay1on = StreamController();
  StreamController _relay2on = StreamController();
  StreamController _relay3on = StreamController();
  @override
  void initState() {
    _relay2on = StreamController();
    _relay1on = StreamController();
    _relay3on = StreamController();
    get();
    try {
      Timer.periodic(Duration(seconds: 3), (Timer t) => relay1off());
      Timer.periodic(Duration(seconds: 3), (Timer t) => relay2off());
     Timer.periodic(Duration(seconds: 3), (Timer t) => relay3off());
    } catch (_) {


    }

    super.initState();
  }
  Future relay1off() async {
    print("relay1off");

    try {
      final response = await http.get('http://192.168.4.1/55');
      if (response.statusCode == 200) {
        _relay1on.add(response.body);
        return (response.body);
      }
    } catch (_) {

    }
  }
  Future relay3off() async {
    print("relay3off");

    try {
      final response = await http.get('http://192.168.4.1/57');
      if (response.statusCode == 200) {
        _relay3on.add(response.body);
        return (response.body);
      }
    } catch (_) {

    }
  }
  Future relay2off() async {
print("relay2off");
    try {
      final response = await http.get('http://192.168.4.1/56');
      if (response.statusCode == 200) {
        _relay2on.add(response.body);
        return (response.body);
      }
    } catch (_) {

    }
  }

  @override
  bool d=true;
  Color c= Color(0xff202227);
  Color k= Colors.lightBlue.withRed(5);
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d==true?c:k,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35, left: 25),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Text(
                  'Smart Home',
                  style: TextStyle(
                    fontFamily: 'SF Rounded',
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(radius: 25,backgroundImage:ExactAssetImage("assets/26769.png")

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          StreamBuilder(
                              stream: _relay1on.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  var content = snapshot.data;
                                  return Text('${content.toString()}\°',
                                    style: TextStyle(
                                      fontFamily: 'SF Rounded',
                                      fontSize: 40,
                                      color: Colors.white.withOpacity(0.78),
                                      fontWeight: FontWeight.w200,
                                    ),
                                    textAlign: TextAlign.left,);
                                }
                                //----------------------------------------
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return Text('0\°',
                                    style: TextStyle(
                                      fontFamily: 'SF Rounded',
                                      fontSize: 40,
                                      color: Colors.white.withOpacity(0.78),
                                      fontWeight: FontWeight.w200,
                                    ),
                                    textAlign: TextAlign.left,);
                                }
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'C'
    ,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Temperature today.',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.72,
                          color: d==true? Colors.white.withOpacity(0.14):Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(backgroundColor: Colors.red,radius: 25,backgroundImage:ExactAssetImage("assets/SER.png")

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                            StreamBuilder(
                                stream: _relay2on.stream,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    var content = snapshot.data;
                                    return Text('${content.toString()}',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 40,
                                        color: Colors.white.withOpacity(0.78),
                                        fontWeight: FontWeight.w200,
                                      ),
                                      textAlign: TextAlign.left,);
                                  }
                                  //----------------------------------------
                                  if (snapshot.connectionState !=
                                      ConnectionState.done) {
                                    return Text('0',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 40,
                                        color: Colors.white.withOpacity(0.78),
                                        fontWeight: FontWeight.w200,
                                      ),
                                      textAlign: TextAlign.left,);
                                  }
                                }),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '%'
                            ,
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Humidity today.',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.72,
                          color:d==true? Colors.white.withOpacity(0.14):Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width:40,),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: 413,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CircleAvatar(backgroundImage:ExactAssetImage("assets/4.jpg")

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 2, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Ebrahim Kassab',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          Text(
                            'Menouf',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 16,
                              color: d==true? Colors.white.withOpacity(0.14):Colors.black.withOpacity(0.99),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //

                StreamBuilder(
                  stream: _relay3on.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var content = snapshot.data;
                      return  Container(
                        width: 80,
                        height: 50,
                        decoration:content==0?  BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ):BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.01, 0.13),
                            end: Alignment(0.97, 0.84),
                            colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'DOOR',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.72),
                            ),
                          ),
                        ),
                      );
                    }
                    if (snapshot.connectionState !=
                        ConnectionState.done) {
                      return Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'DOOR',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors. white.withOpacity(0.72),
                            ),
                          ),
                        ),
                      );
                    }

                  }
                )
              ],
            ),
          ),

          //
          Expanded(
            child: MyGridView(),
          ),
          //
        ],
        //
      ),
      // Borrom bar
      floatingActionButton: Transform.scale(
        scale: 1,
        child: Transform.translate(
          offset: Offset(0, -8),
          child: GestureDetector(
            onTap:l==false?null: () {
              heaters("OFF",0);
              print('FAB tapped');
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0),
                  end: Alignment(0.5, 1),
                  colors:l==false?[Colors.black,Colors.black]: [Color(0xff7afc79), Color(0xff3ccb97)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 18,
                    color: Color(0xff7afc79).withOpacity(0.26),
                  )
                ],
              ),
              child:dd||loading==true?CircularProgressIndicator(): SvgPicture.asset(
                'assets/spark.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //

      //
    );
  }
  var  dd=false;
  var loading=false;
  var l=true;
  var heater;
  _incrementCounter(i,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("${i.toString()}", value);
  }
  var i1;
  get()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    i1=prefs.get("OFF");

    setState(() {
      loading=false;
    });

    print(i1);


    if(i1==null){
l=true;
setState(() {

});
    }else if(i1==0) {
      setState(() {

      });
      l=false;
    }







  }
  Future heaters(name,n)async {


    setState(() {
      dd=true;
    });
    try {
      http.Response response = await http.get("http://192.168.4.1/0");
      if (response.statusCode == 200) {
        setState(() {
          heater = json.decode(response.body);
        });
        _incrementCounter(name,n);
        setState(() {
          dd=false;
          l=false;
        });
      } else {
        print(response.statusCode);
        await Future.delayed(Duration(seconds: 1));
        heaters(name,n);
      }
    } catch (e) {
      print(e);
      setState(() {
        dd=false;
      });
      _showtoastforfav(context);
    }
  }

  _showtoastforfav(c){
    Fluttertoast.showToast(
        msg: "Not work",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 14
    );
  }
}
