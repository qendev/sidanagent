 import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
  ),
      debugShowCheckedModeBanner: false,
      home: DashBoard(),
    ));

class DashBoard extends StatefulWidget {

  final User user;

  const DashBoard({Key key, this.user}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  final GlobalKey <ScaffoldState> _scaffoldKey = GlobalKey <ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006DFF),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 56, 0, 0),
          child: SafeArea(
            child: Column(children: [
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('assets/user.jpg'),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              'ACTIVE',
                              style: TextStyle(color: Color(0xff4CD964), fontSize: 13, fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 24, 0, 0),
                        child: Text(
                            'Hello James',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 30,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Color(0xff4CD964),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Text(
                              'AVAILABLE',
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 2, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
             ///Here comes the chips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: SizedBox(
                          width: 150,
                          height: 25,
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 2, 0, 0),
                                child: Image.asset('assets/Group.png'),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(8, 0, 0, 2),
                                  child: Text(
                                    'Wash Utensils',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: SizedBox(
                          width: 150,
                          height: 25,
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 2, 0, 0),
                                child: Image.asset('assets/Group.png'),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(8, 0, 0, 2),
                                  child: Text(
                                    'Wash Clothes',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Served Amount Part
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 16, 0, 0),
                        child: Text(
                          'SERVED',
                          style: TextStyle(
                              color: Colors.white, letterSpacing: 2.5),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                              child: Text(
                                '20',
                                style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.5),
                              ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 16, 0, 0),
                        child: Text(
                          'AMOUNT',
                          style: TextStyle(
                              color: Colors.white, letterSpacing: 2.5),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                              child: Text(
                                'KSH 20,000',
                                style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    child:
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(maxHeight: 150.0),
                            child: Material(
                              color: Color(0xff006DFF),
                              child: TabBar(
                                indicatorColor: Colors.white,
                                tabs: [
                                  Text(
                                      'NOTIFICATIONS',
                                      style: TextStyle(letterSpacing: 1),
                                  ),
                              Text(
                                  'SERVICES SERVED',
                                style: TextStyle(letterSpacing: 0.2),
                              ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Expanded(
                            child: TabBarView(
                              children: [
                               ListView(
                                 children: [
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                   'ORDER NO #35678',
                                                 style: TextStyle(
                                                     color: Colors.yellow[700],
                                                     fontSize: 13,
                                                     ),
                                               ),
                                               SizedBox(height: 15,),
                                               Text(
                                                   'Wash Clothes',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                   'Nairobi Ngara area house 51',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                   'Tomorrow at 3pm',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                   'Please come with your own scrubber',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               SizedBox(
                                                 width: 170.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xffFF0A0A),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'ACCEPT',
                                                       style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               Text(
                                                   '11 items',
                                                   style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                               ),
                                               SizedBox(height: 15,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       'Ksh',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                   ),
                                                   Text(
                                                       '1,700',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                 ],
                                               ),
                                               SizedBox(height: 25,),
                                               SizedBox(
                                                 width: 70.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Colors.white,
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(1.0),
                                                       side: BorderSide(color: Color(0xff7B8794),)
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'DENY',
                                                       style: TextStyle(color: Color(0xff7B8794), fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'ORDER NO #45678',
                                                 style: TextStyle(
                                                   color: Colors.yellow[700],
                                                   fontSize: 13,
                                                 ),
                                               ),
                                               SizedBox(height: 15,),
                                               Text(
                                                 'Wash Clothes',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Nairobi Ngara area house 51',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Tomorrow at 3pm',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Please come with your own scrubber',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               SizedBox(
                                                 width: 170.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xff006DFF),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'TAP TO COMPLETE TASK',
                                                       style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(0, 1, 20, 0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               ///CHIPS COMES HERE
                                               Row(
                                                 children: <Widget>[
                                                   Container(
                                                     margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                     padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                                     decoration: BoxDecoration(
                                                       color: Color(0xff4CD964),
                                                         border: Border.all(
                                                           color: Colors.green,
                                                         ),
                                                         borderRadius:
                                                         BorderRadius.all(Radius.circular(20))),
                                                     child: SizedBox(
                                                       width: 95,
                                                       height: 25,
                                                       child: Row(
                                                         children: <Widget>[
                                                           Container(
                                                               margin: EdgeInsets.fromLTRB(6, 4, 0, 2),
                                                               child: Text(
                                                                 'Process Ongoing',
                                                                 style: TextStyle(color: Colors.white, fontSize: 11),
                                                               ))
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               SizedBox(height: 16,),
                                               Text(
                                                   '11 items',
                                                   style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                               ),
                                               SizedBox(height: 15,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       'Ksh',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                   ),
                                                   Text(
                                                       '1,700',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                 ],
                                               ),
                                               SizedBox(height: 6,),
                                               SizedBox(
                                                 width: 80.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Colors.white,
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(1.0),
                                                       side: BorderSide(color: Color(0xffE02B2B),)
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'CANCEL',
                                                       style: TextStyle(color: Color(0xffE02B2B), fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'ORDER NO #35678',
                                                 style: TextStyle(
                                                   color: Colors.yellow[700],
                                                   fontSize: 13,
                                                 ),
                                               ),
                                               SizedBox(height: 15,),
                                               Text(
                                                 'Wash Clothes',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Nairobi Ngara area house 51',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Tomorrow at 3pm',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Please come with your own scrubber',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               SizedBox(
                                                 width: 150.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xffDCDCDC),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'WORKING...',
                                                       style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               Text(
                                                   '11 items',
                                                   style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                               ),
                                               SizedBox(height: 15,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       'Ksh',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                   ),
                                                   Text(
                                                       '1,700',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                 ],
                                               ),
                                               SizedBox(height: 20,),
                                               SizedBox(
                                                 width: 100.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xff4CD964),
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'COMPLETED',
                                                       style: TextStyle(color: Colors.white, fontSize: 11.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'ORDER NO #35678',
                                                 style: TextStyle(
                                                   color: Colors.yellow[700],
                                                   fontSize: 13,
                                                 ),
                                               ),
                                               SizedBox(height: 15,),
                                               Text(
                                                 'Wash Clothes',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Nairobi Ngara area house 51',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Tomorrow at 3pm',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Please come with your own scrubber',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               SizedBox(
                                                 width: 170.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xffFF0A0A),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'ACCEPT',
                                                       style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               Text(
                                                   '11 items',
                                                   style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                               ),
                                               SizedBox(height: 15,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       'Ksh',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                   ),
                                                   Text(
                                                       '1,700',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                 ],
                                               ),
                                               SizedBox(height: 25,),
                                               SizedBox(
                                                 width: 70.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Colors.white,
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(1.0),
                                                       side: BorderSide(color: Color(0xff7B8794),)
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'DENY',
                                                       style: TextStyle(color: Color(0xff7B8794), fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Card(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'ORDER NO #35678',
                                                 style: TextStyle(
                                                   color: Colors.yellow[700],
                                                   fontSize: 13,
                                                 ),
                                               ),
                                               SizedBox(height: 15,),
                                               Text(
                                                 'Wash Clothes',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Nairobi Ngara area house 51',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Tomorrow at 3pm',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               Text(
                                                 'Please come with your own scrubber',
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 11,
                                                 ),
                                               ),
                                               SizedBox(height: 5,),
                                               SizedBox(
                                                 width: 170.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Color(0xffFF0A0A),
                                                   shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius.circular(3.0),
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'ACCEPT',
                                                       style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Padding(
                                           padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.end,
                                             children: [
                                               Text(
                                                   '11 items',
                                                   style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                               ),
                                               SizedBox(height: 15,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       'Ksh',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                   ),
                                                   Text(
                                                       '1,700',
                                                       style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                 ],
                                               ),
                                               SizedBox(height: 25,),
                                               SizedBox(
                                                 width: 70.0,
                                                 child: RaisedButton(
                                                   elevation: 0,
                                                   color: Colors.white,
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(1.0),
                                                       side: BorderSide(color: Color(0xff7B8794),)
                                                   ),
                                                   onPressed: () async {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => DashBoard()),
                                                     );
                                                   },
                                                   child: Text(
                                                       'DENY',
                                                       style: TextStyle(color: Color(0xff7B8794), fontSize: 12.0,)
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                                //Services Served
                                ListView(
                                  children: [
                                    Card(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ORDER NO #45678',
                                                      style: TextStyle(
                                                        color: Colors.yellow[700],
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    SizedBox(height: 15,),
                                                    Text(
                                                      'Wash Clothes',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      'Nairobi Ngara area house 51',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      'Tomorrow at 3pm',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      'Please come with your own scrubber',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5,),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(0, 1, 20, 0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    ///CHIPS COMES HERE
                                                    Row(
                                                      children: <Widget>[
                                                        Container(
                                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                                          decoration: BoxDecoration(
                                                              color: Color(0xffD9A94C),
                                                              border: Border.all(
                                                                color: Colors.white,
                                                              ),
                                                              borderRadius:
                                                              BorderRadius.all(Radius.circular(20))),
                                                          child: SizedBox(
                                                            width: 95,
                                                            height: 25,
                                                            child: Row(
                                                              children: <Widget>[
                                                                Container(
                                                                    margin: EdgeInsets.fromLTRB(3, 4, 0, 2),
                                                                    child: Text(
                                                                      'Process Completed',
                                                                      style: TextStyle(color: Colors.white, fontSize: 10),
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 16,),
                                                    Text(
                                                        '11 items',
                                                        style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                                    ),
                                                    SizedBox(height: 15,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            'Ksh',
                                                            style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                        ),
                                                        Text(
                                                            '1,700',
                                                            style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 6,),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                            child: SizedBox(
                                              width: 300.0,
                                              child: RaisedButton(
                                                elevation: 0,
                                                color: Color(0xff006DFF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(3.0),
                                                ),
                                                onPressed: () async {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DashBoard()),
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        'Task Completed',
                                                        style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                    ),
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Color(0Xff4CD964),
                                                      size: 30.0,
                                                    ),
                                                  ],
                                                )
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                    Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'ORDER NO #45678',
                                                        style: TextStyle(
                                                          color: Colors.yellow[700],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Text(
                                                        'Wash Clothes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Nairobi Ngara area house 51',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Tomorrow at 3pm',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Please come with your own scrubber',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 1, 20, 0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      ///CHIPS COMES HERE
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xffD9A94C),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius.all(Radius.circular(20))),
                                                            child: SizedBox(
                                                              width: 95,
                                                              height: 25,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Container(
                                                                      margin: EdgeInsets.fromLTRB(3, 4, 0, 2),
                                                                      child: Text(
                                                                        'Process Completed',
                                                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Text(
                                                          '11 items',
                                                          style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Ksh',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                          ),
                                                          Text(
                                                              '1,700',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                              child: SizedBox(
                                                width: 300.0,
                                                child: RaisedButton(
                                                    elevation: 0,
                                                    color: Color(0xff006DFF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => DashBoard()),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            'Task Completed',
                                                            style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                        ),
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Color(0Xff4CD964),
                                                          size: 30.0,
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'ORDER NO #45678',
                                                        style: TextStyle(
                                                          color: Colors.yellow[700],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Text(
                                                        'Wash Clothes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Nairobi Ngara area house 51',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Tomorrow at 3pm',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Please come with your own scrubber',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 1, 20, 0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      ///CHIPS COMES HERE
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xffD9A94C),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius.all(Radius.circular(20))),
                                                            child: SizedBox(
                                                              width: 95,
                                                              height: 25,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Container(
                                                                      margin: EdgeInsets.fromLTRB(3, 4, 0, 2),
                                                                      child: Text(
                                                                        'Process Completed',
                                                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Text(
                                                          '11 items',
                                                          style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Ksh',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                          ),
                                                          Text(
                                                              '1,700',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                              child: SizedBox(
                                                width: 300.0,
                                                child: RaisedButton(
                                                    elevation: 0,
                                                    color: Color(0xff006DFF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => DashBoard()),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            'Task Completed',
                                                            style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                        ),
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Color(0Xff4CD964),
                                                          size: 30.0,
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    Card(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'ORDER NO #45678',
                                                        style: TextStyle(
                                                          color: Colors.yellow[700],
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Text(
                                                        'Wash Clothes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Nairobi Ngara area house 51',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Tomorrow at 3pm',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        'Please come with your own scrubber',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 1, 20, 0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      ///CHIPS COMES HERE
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xffD9A94C),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius.all(Radius.circular(20))),
                                                            child: SizedBox(
                                                              width: 95,
                                                              height: 25,
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Container(
                                                                      margin: EdgeInsets.fromLTRB(3, 4, 0, 2),
                                                                      child: Text(
                                                                        'Process Completed',
                                                                        style: TextStyle(color: Colors.white, fontSize: 10),
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16,),
                                                      Text(
                                                          '11 items',
                                                          style: TextStyle(color: Color(0xff2F80ED), fontSize: 14.0,)
                                                      ),
                                                      SizedBox(height: 15,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Ksh',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 11.0,)
                                                          ),
                                                          Text(
                                                              '1,700',
                                                              style: TextStyle(color: Color(0xff2F80ED), fontSize: 17.0, fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                      SizedBox(height: 6,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                              child: SizedBox(
                                                width: 300.0,
                                                child: RaisedButton(
                                                    elevation: 0,
                                                    color: Color(0xff006DFF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(3.0),
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => DashBoard()),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                            'Task Completed',
                                                            style: TextStyle(color: Colors.white, fontSize: 12.0,)
                                                        ),
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Color(0Xff4CD964),
                                                          size: 30.0,
                                                        ),
                                                      ],
                                                    )
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ),
              ],
            )
          ),
          ),
        ),
    );
  }
}
