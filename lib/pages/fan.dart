import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class fan extends StatefulWidget {


  @override
  _fanState createState() => _fanState();
}

class _fanState extends State<fan> {  var heater;
_incrementCounter(i,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("${i.toString()}", value);
}
int i1;
int i2;
int i3;
//ssssssssssssssssssssssssssssssssssssssssssssss
get()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  i1=prefs.get("Fan 1");
  i2=prefs.get("Fan 2");
  i3=prefs.get("Fan 3");
  setState(() {
    loading=false;
  });

  print(i1);


  if(i1==null){
    setState(() {
      count=false;
    });
  }else{
    count=true;
    groub=i1;
    isSelected = true;
  }


  if(i3==null){
    setState(() {
      count2=false;
    });
  }else{
    count2=true;
    groub2=i3;
    isSelected3 = true;
  }


  if(i2==null){
    setState(() {
      count1=false;
    });
  }else{
    count1=true;
    groub1=i2;
    isSelected2 = true;
  }



}
var  dd=false;
Future heaters(name,n)async {
  setState(() {
    dd=true;
  });
  try {
    http.Response response = await http.get("http://192.168.4.1/${n.toString()}");
    if (response.statusCode == 200) {
      setState(() {
        heater = json.decode(response.body);
      });
      _incrementCounter(name,n);
      setState(() {
        dd=false;
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
@override
void initState() {
  get();// TODO: implement initState
  super.initState();
}
@override
int groub=null;
int groub1=null;
int groub2=null;
bool isSelected = false;
bool isSelected2 = false;
bool isSelected3= false;
var count=false;
var count1=false;
var count2=false;
bool loading = true;
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final hight = MediaQuery.of(context).size.height;
  return Scaffold(backgroundColor: Color(0xff202227),

    appBar: AppBar(centerTitle: true,title: Text("Fans"),backgroundColor: Color(0xff202227),elevation: 0,),
    body: Stack(
      children: [
        Container(color: Colors.black,
          child:ListView(
            children: [
              Card(color:  Color(0xff202227),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Card(elevation: 0,child:Container(   decoration: isSelected
                          ? BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                           Colors.blueAccent.withOpacity(0.2),
                            Color(0xff262d2e).withOpacity(0.2)
                          ],
                          radius: 0.72,
                          center: Alignment(0, 0),
                        ),

                        borderRadius: BorderRadius.circular(27),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: const Color(0xff000000).withOpacity(0.16),
                          )
                        ],
                      )
                          : null,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 00),child:   Lottie.asset('assets/fanimation.json',width:120),),
                                Column(crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [
                                    Text("Fan 1",style: TextStyle(color: Colors.white,fontSize: 22),),
                                    SizedBox(height: 20,),
                                    Switch(value: count, onChanged: (c){
                                      setState(() {
                                        isSelected = !isSelected;
                                        print('Button Selected = $isSelected'); //log
                                      });

                                      if(c==false){

                                        count=c;
                                        heaters("Fan 1",15);
                                        setState(() {
                                          groub=null;
                                        });
                                        print("off");
                                      }else if(c==true){
                                        count=c;
                                        heaters("Fan 1",16);
                                        setState(() {
                                          groub=16;
                                        });
                                        print(groub);
                                        print("onn");
                                      }
                                    })



                                  ],
                                )

                              ],
                            ),
                            SizedBox(height: 20,),
                            groub==null?SizedBox(child: Text(""),):    Row(mainAxisSize: MainAxisSize.min,children: [
                              Column(
                                children: [
                                  Radio(value:16, groupValue: groub, onChanged: (d){
                                    heaters("Fan 1",16);
                                    setState(() {

                                    });
                                    groub=d;
                                    print(groub);
                                  },activeColor: Colors.greenAccent[700]),
                                  Text("1",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:17, groupValue: groub, onChanged: (d){
                                    heaters("Fan 1",17);
                                    setState(() {

                                    });
                                    groub=d;
                                    print(groub);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("2",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:18, groupValue: groub, onChanged: (d){
                                    heaters("Fan 1",18);
                                    setState(() {

                                    });
                                    groub=d;
                                    print(groub);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("3",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),



                            ],)
                          ],
                        ),

                      ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),color: Color(0xff202227),),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(color:  Color(0xff202227),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Card(child:Container(decoration: isSelected2
                          ? BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.blueAccent.withOpacity(0.2),
                            Color(0xff262d2e).withOpacity(0.2)
                          ],
                          radius: 0.72,
                          center: Alignment(0, 0),
                        ),

                        borderRadius: BorderRadius.circular(27),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: const Color(0xff000000).withOpacity(0.16),
                          )
                        ],
                      )
                          : null,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 0),child:   Lottie.asset('assets/fanimation.json',width:120),),
                                Column(crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [
                                    Text("Fan 2",style: TextStyle(color: Colors.white,fontSize: 22),),
                                    SizedBox(height: 20,),
                                    Switch(value: count1, onChanged: (c){
                                      setState(() {
                                        isSelected2 = !isSelected2;
                                        print('Button Selected = $isSelected2'); //log
                                      });
                                      if(c==false){
                                        count1=c;
                                        heaters("Fan 2",21);
                                        setState(() {
                                          groub1=null;
                                        });
                                        print("off");
                                      }else if(c==true){
                                        count1=c;
                                        heaters("Fan 2",22);
                                        setState(() {
                                          groub1=22;
                                        });
                                        print("onn");
                                      }
                                    })



                                  ],
                                )

                              ],
                            ),
                            SizedBox(height: 20,),
                            groub1==null?SizedBox(child: Text(""),):    Row(mainAxisSize: MainAxisSize.min,children: [
                              Column(
                                children: [
                                  Radio(value:22, groupValue:    groub1, onChanged: (d){
                                    heaters("Fan 2",22);
                                    setState(() {

                                    });
                                    groub1=d;
                                    print(   groub1);
                                  },activeColor: Colors.greenAccent[700]),
                                  Text("1",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:23, groupValue:   groub1, onChanged: (d){
                                    heaters("Fan 2",23);
                                    setState(() {

                                    });
                                    groub1=d;
                                    print(   groub1);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("2",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:24, groupValue:    groub1, onChanged: (d){
                                    heaters("Fan 2",24);
                                    setState(() {

                                    });
                                    groub1=d;
                                    print(   groub1);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("3",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),



                            ],)
                          ],
                        ),

                      ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),color: Color(0xff202227),),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(color:  Color(0xff202227),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Card(child:Container(decoration: isSelected3
                          ? BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.blueAccent.withOpacity(0.2),
                            Color(0xff262d2e).withOpacity(0.2)
                          ],
                          radius: 0.72,
                          center: Alignment(0, 0),
                        ),

                        borderRadius: BorderRadius.circular(27),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 6,
                            color: const Color(0xff000000).withOpacity(0.16),
                          )
                        ],
                      )
                          : null,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start ,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 0),child:   Lottie.asset('assets/fanimation.json',width:120),),
                                Column(crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [
                                    Text("Fan 3",style: TextStyle(color: Colors.white,fontSize: 22),),
                                    SizedBox(height: 20,),
                                    Switch(value: count2, onChanged: (c){
                                      setState(() {
                                        isSelected3 = !isSelected3;
                                        print('Button Selected = $isSelected3'); //log
                                      });
                                      if(c==false){
                                        count2=c;
                                        heaters("Fan 3",27);
                                        setState(() {
                                          groub2=null;
                                        });
                                        print("off");
                                      }else if(c==true){
                                        count2=c;
                                        heaters("Fan 3",28);
                                        setState(() {
                                          groub2=28;
                                        });
                                        print(groub2);
                                        print("onn");
                                      }
                                    })



                                  ],
                                )

                              ],
                            ),
                            SizedBox(height: 20,),
                            groub2==null?SizedBox(child: Text(""),):    Row(mainAxisSize: MainAxisSize.min,children: [
                              Column(
                                children: [
                                  Radio(value:28, groupValue: groub2, onChanged: (d){
                                    heaters("Fan 3",28);
                                    setState(() {

                                    });
                                    groub2=d;
                                    print(groub2);
                                  },activeColor: Colors.greenAccent[700]),
                                  Text("1",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:29, groupValue: groub2, onChanged: (d){
                                    heaters("Fan 3",29);
                                    setState(() {

                                    });
                                    groub2=d;
                                    print(groub2);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("2",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),
                              Column(
                                children: [
                                  Radio(value:30, groupValue: groub2, onChanged: (d){
                                    heaters("Fan 3",30);
                                    setState(() {

                                    });
                                    groub2=d;
                                    print(groub2);
                                  },activeColor: Colors.greenAccent[700],),
                                  Text("3",style: TextStyle(color: Colors.white,fontSize: 15))
                                ],
                              ),



                            ],)
                          ],
                        ),

                      ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),color: Color(0xff202227),),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        loading|| dd==true
            ? Container(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    width / 18,
                  ),
                  color: Theme.of(context).backgroundColor),
              height: hight / 5.81,
              width: width / 2.76,
              child: Center(child: Text("waiting....",style: TextStyle(color: Colors.white,fontSize: 25),)),
            ),
          ),
          width: width,
          height: hight,
          color: Color(0xff202227),
        )
            : Center(
          child: SizedBox(),
        ),
      ],
    ),
  );
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
