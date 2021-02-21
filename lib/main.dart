import 'package:flutter/material.dart';

import 'package:sidan_agent/SignUp.dart';
import 'package:sidan_agent/LoginPage.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006DFF),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            children: [
              SizedBox(
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/icon.png'),
                  )),
              SizedBox(height: 20,),
              Text(
                  'SIDAN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              SizedBox(height: 20,),
              Text(
                  'Kenya'+'s'+' best home service app.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  )
              ),
              SizedBox(height: 70,),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SizedBox(
                  width: 320.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    color: Color(0xffFFA451),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white, fontSize: 17.0,)
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SizedBox(
                  width: 320.0,
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    color: Color(0xffFFA451),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'SIGN IN',
                            style: TextStyle(color: Colors.white, fontSize: 17.0,)
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffFFA451)),
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    color: Color(0xff006DFF),
                    onPressed: () async {

                    },
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'REQUEST FOR SERVICE',
                            style: TextStyle(color: Colors.white, fontSize: 17.0,)
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}