import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:sidan_agent/DashBoard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsSignup(),
    ));

class DetailsSignup extends StatefulWidget {

 DetailsSignup({this.uid, User user});

  final String uid;

  @override
  _DetailsSignupState createState() => _DetailsSignupState();
}



class _DetailsSignupState extends State<DetailsSignup> {

  ProgressDialog pr;

  TextEditingController idnumberController = TextEditingController();
  TextEditingController policeabstractController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();





  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;




  List<String> _locations = ['English', 'Swahili'];
  String _selectedLocation; // Option 2
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Text('SignUp To Sidan App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 280, 0),
                  child: SizedBox(
                    height: 80,
                    child: Image(
                      image: AssetImage('assets/worker.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text('Step 2/2',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 16, 0, 0),
                  child: FractionallySizedBox(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 140,
                              height: 50,
                              child: RaisedButton(
                                color: Colors.yellow[700],
                                onPressed: () {},
                                child: Text(
                                  'Upload Face Photo',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                              child: CircleAvatar(
                                radius: 48.0,
                                backgroundImage:
                                    AssetImage('assets/user.jpg'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                height: 24,
                                child: RaisedButton(
                                  color: Colors.yellow[700],
                                  onPressed: () {},
                                  child: Text(
                                    'Upload ID Card',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                                child: Image.asset('assets/id.png'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: idnumberController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
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
                      // prefixIcon: Icon(Icons.person),
                      hintText: "Id No",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1)),
                    child: SizedBox(
                      width: 295.0,
                      height: 50.0,
                      child:
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text('Select language'), // Not necessary for Option 1
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          iconSize: 35.0,
                          style: TextStyle(color: Colors.blue),
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: policeabstractController,
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
                      // prefixIcon: Icon(Icons.email),
                      hintText: "Police Abstarct",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: phonenumberController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
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
                      // prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Phone Number",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: SizedBox(
                    width: 320.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      color: Color(0xffFFA451),
                      onPressed: () async {
                        // signUp();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
                        _saveForm;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('FINISH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              )),
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
            Container(
              padding: EdgeInsets.all(16),
              child: Text(_myActivityResult),
            )
          ],
        ),
      ),
    );
  }

  // void signUp() async {
  //   setState(() {
  //     pr.show();
  //   });
  //   var id;
  //   dynamic _idnumber = idnumberController.text;
  //   dynamic _policeabtract = policeabstractController.text;
  //   dynamic _email = emailController.text;
  //   dynamic _password = passwordController.text;
  //   dynamic _phonumber = phonenumberController.text;
  //
  //
  //   final User user = (await auth.createUserWithEmailAndPassword(
  //       email: _email, password: _password))
  //       .user;
  //
  //   if(user!=null){
  //     setState(() {
  //       pr.hide();
  //     });
  //     await user.updateProfile(displayName: _firstname);
  //     id = user.uid;
  //     firestoreInstance.collection("agents").doc(id).set(
  //         {
  //           "firstname" : _firstname,
  //           "secondname" : _secondname,
  //           "email" : _email,
  //           "password" : _password,
  //           "services" : _services,
  //           "location" : _location,
  //
  //
  //         });
  //     final user1 = auth.currentUser;
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
  //       return DetailsSignup(user:user1);
  //     })
  //     );
  //   }
  //
  //
  // }
}
