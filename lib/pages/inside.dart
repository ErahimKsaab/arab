import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class inside extends StatefulWidget {
  @override
  _insideState createState() => _insideState();
}

class _insideState extends State<inside> {
  var  dd=false;
  var bulp=[];
  int c=0;
  _incrementCounter(i,value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("${i.toString()}", value);
  }
  int i1;
  int i2;
  int i3;
  int i4;
  int i5;
  void initState() {
    get();// TODO: implement initState
    super.initState();
  }
  get()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    i1=prefs.get("P1");
    i2=prefs.get("P2");
    i3=prefs.get("P3");
    i4=prefs.get("P4");
    i5=prefs.get("P5");

    setState(() {
      loading=false;
    });

    if (i1==1){
      c++;
      setState(() {
        Switch1=true;
        S1=true;
      });
    }else{
      c++;
      setState(() {
        Switch1=false;
        S1=false;
      });
    }

    if (i2==3){
      c++;
      setState(() {
        S2=true;
        Switch2=true;
      });
    }else{
      c++;
      setState(() {
        Switch2=false;
        S2=false;
      });
    }
    if (i3==5){
      c++;
      setState(() {
        S3=true;
        Switch3=true;
      });
    }else{
      c++;
      setState(() {
        Switch3=false;
        S3=false;
      });
    }
    if (i4==7){
      c++;
      setState(() {
        S4=true;
        Switch4=true;
      });
    }else{
      c++;
      setState(() {
        Switch4=false;
        S4=false;
      });
    }
    if (i5==9){
      c++;
      setState(() {
        S5=true;
        Switch5=true;
      });
    }else{
      c++;
      setState(() {
        Switch5=false;
        S5=false;
      });
    }
//    setState(() {
//      loading=false;
//    });
    print(i1);
    print(i2);
    if(c!=0){
      setState(() {
        loading=false;
      });

    }



  }
  Future Bulp(name,n)async {

    setState(() {
      dd=true;
    });
    try {
      http.Response response = await http.get("http://192.168.4.1/${n.toString()}");
      if (response.statusCode == 200) {
        setState(() {
          bulp = json.decode(response.body);
        });
      _incrementCounter(name,n);

        setState(() {
          dd=false;
        });
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
  var S1=false;
  var S2=false;
  var S3=false;
  var S4=false;
  var S5=false;


  var Switch1=false;
  var Switch2=false;
  var Switch3=false;
  var Switch4=false;
  var Switch5=false;

  bool loading = true;
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xff202227),
        appBar: AppBar(title: Text("In Side"),centerTitle: true,backgroundColor: Color(0xff202227),elevation: 0),
        body:Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),color: Color(0xff202227),borderRadius: BorderRadius.circular(70)),child:
                    ListTile(trailing:

                    Switch(value:Switch1,

                        onChanged:(c){
                          if(c==true){
                            print('on');
                            Bulp("P1",1);
                            S1=true;
                            setState(() {

                            });
                          }else{
                            print('off');
                            Bulp("P1",2);
                            setState(() {

                            });
                            S1=false;
                          }
                          print(c);
                          setState(() {
                            Switch1=c;
                          });

                        } )


                      ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),title: Text("1",style: TextStyle(color:S1? Colors.white:Colors.black),),subtitle:  Text("on",style: TextStyle(color:S1? Colors.white:Colors.black)),leading: CircleAvatar(backgroundColor: Color(0xff202227) ,child:  SvgPicture.asset('assets/lamp.svg',width: 100,height: 100,),),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),color: Color(0xff202227),borderRadius: BorderRadius.circular(70)),child: ListTile(trailing:
                    Switch(value: Switch2, onChanged:(c){
                      if(c==true){
                        print('on');
                        Bulp("P2",3);
                        setState(() {

                        });
                        S2=true;
                      }else{
                        setState(() {

                        });
                        S2=false;
                        print('off');
                        Bulp("P2",4);
                      }
                      setState(() {
                        Switch2=c;
                      });

                    } ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),title: Text("2",style: TextStyle(color:S2? Colors.white:Colors.black)),subtitle:  Text("on",style: TextStyle(color:S2? Colors.white:Colors.black)),leading: CircleAvatar(backgroundColor: Color(0xff202227) ,child:  SvgPicture.asset('assets/lamp.svg',width: 100,height: 100,),),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),color: Color(0xff202227),borderRadius: BorderRadius.circular(70)),child: ListTile(trailing:
                    Switch(value: Switch3, onChanged:(c){
                      if(c==true){
                        print('on');
                        Bulp("P3",5);
                        setState(() {

                        });
                        S3=true;
                      }else{
                        setState(() {

                        });
                        S3=false;
                        print('off');
                        Bulp("P3",6);
                      }
                      setState(() {
                        Switch3=c;
                      });

                    } ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),title: Text("3",style: TextStyle(color:S3? Colors.white:Colors.black)),subtitle:  Text("on",style: TextStyle(color:S3? Colors.white:Colors.black)),leading: CircleAvatar(backgroundColor: Color(0xff202227) ,child:  SvgPicture.asset('assets/lamp.svg',width: 100,height: 100,),),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),color: Color(0xff202227),borderRadius: BorderRadius.circular(70)),child: ListTile(trailing:
                    Switch(value: Switch4, onChanged:(c){
                      if(c==true){
                        print('on');
                        Bulp("P4",7);
                        setState(() {

                        });
                        S4=true;
                      }else{
                        setState(() {

                        });
                        S4=false;
                        print('off');
                        Bulp("P4",8);
                      }
                      setState(() {
                        Switch4=c;
                      });

                    } ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),title: Text("4",style: TextStyle(color:S4? Colors.white:Colors.black)),subtitle:  Text("on",style: TextStyle(color:S4? Colors.white:Colors.black)),leading: CircleAvatar(backgroundColor: Color(0xff202227) ,child:  SvgPicture.asset('assets/lamp.svg',width: 100,height: 100,),),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),color: Color(0xff202227),borderRadius: BorderRadius.circular(70)),child: ListTile(trailing:
                    Switch(value: Switch5, onChanged:(c){
                      if(c==true){
                        print('on');
                        Bulp("P5",9);
                        setState(() {

                        });
                        S5=true;
                      }else{
                        setState(() {

                        });
                        S5=false;
                        print('off');
                        Bulp("P5",10);
                      }
                      setState(() {
                        Switch5=c;
                      });

                    } ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),title: Text("5",style: TextStyle(color:S5? Colors.white:Colors.black)),subtitle:  Text("on",style: TextStyle(color:S5? Colors.white:Colors.black)),leading: CircleAvatar(backgroundColor: Color(0xff202227) ,child:  SvgPicture.asset('assets/lamp.svg',width: 100,height: 100,),),)),
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
        )
    );
  }
}

_showtoastforfav(c) {
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