import 'package:flutter/material.dart';
import 'package:sidan_agent/DashBoard.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sidan_agent/DetailsSignup.dart';
void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    )
);

class LoginPage extends StatefulWidget {

  LoginPage({this.uid, User user});

  final String uid;


  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  ProgressDialog pr;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    pr = new ProgressDialog(context);

    //style the progressbar
    pr.style(
        message: 'Please Wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));



    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006DFF),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: SizedBox(
                      width: 200,
                      child: Image(
                        image: AssetImage('assets/icon.png'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      // keyboardType: TextInputType.number,
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(2.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      // keyboardType: TextInputType.number,
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(2.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: SizedBox(
                    width: 320.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      color: Color(0xffFFA451),
                      onPressed: () async {
                        signInWithEmailAndPassword();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'NEXT',
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signInWithEmailAndPassword() async{
    setState(() {
      pr.show();
    });
    dynamic _email = emailController.text;
    dynamic _password = passwordController.text;
    try {
      final User user = (await auth.signInWithEmailAndPassword(email: _email, password: _password)
      ).user;

      if (user != null) {
        setState(() {
          pr.hide();
        });
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_){
        return DashBoard(user: user,
        );
      }));
    }
    catch (e) {
      print(e);
    }

  }
}
