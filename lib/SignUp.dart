import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:sidan_agent/DashBoard.dart';
import 'package:sidan_agent/DetailsSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() =>
    runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUp(),
        )
    );

class SignUp extends StatefulWidget {
  final User user;

  const SignUp({Key key, this.user}) : super(key: key);

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);




  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  ProgressDialog pr;


  String email, password;

  PickResult selectedPlace;



  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController servicesController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final firestoreInstance = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child(
      "Users");


  @override
  Widget build(BuildContext context) {
    //initialize the progressbar
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
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
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
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  // child: Text('SignUp To Sidan App',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18.0,
                  //     )),
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
                      Text(
                          'Step 1/2',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: firstnameController,
                    textInputAction: TextInputAction.done,

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
                      prefixIcon: Icon(Icons.person),
                      hintText: "First Name",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: secondnameController,
                    textInputAction: TextInputAction.done,

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
                      prefixIcon: Icon(Icons.person),
                      hintText: "Second Name",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,

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
                    textInputAction: TextInputAction.done,

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
                      hintText: "PASSWORD",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: servicesController,
                    textInputAction: TextInputAction.done,

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
                      // prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Services to Offer",
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextField(
                    controller: locationController,
                    textInputAction: TextInputAction.done,

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
                      prefixIcon: FlatButton(
                        onPressed: (){
                          openMap();
                        },
                          child: Icon(Icons.location_on_rounded)),
                      hintText: "Location",
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
                        sigUpUser();


                        // dynamic firstname = firstnameController.text;
                        // dynamic secondname = secondnameController.text;
                        // dynamic email = emailController.text;
                        // dynamic services = servicesController.text;
                        // dynamic location = locationController.text;
                        // dynamic password = passwordController.text;


                        // await auth.createUserWithEmailAndPassword(
                        //     email: email, password: password)
                        //     .then((result) {
                        //   firestoreInstance.collection("agents").doc(
                        //       result.user.uid).set(
                        //       {
                        //         "firstname": firstname,
                        //         "secondname": secondname,
                        //         "email": email,
                        //         "services": services,
                        //         "location": location,
                        //
                        //       }).then((value) {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => DetailsSignup()),
                        //     // );
                        //
                        //     print('success!');
                        //   });
                        // }).catchError((err) {
                        //   print(err);
                        //
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           title: Text("Error"),
                        //           content: Text(err.message),
                        //           actions: [
                        //             FlatButton(
                        //               child: Text("Ok"),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             )
                        //           ],
                        //         );
                        //       });
                        //
                        //
                        // });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'NEXT',
                              style: TextStyle(
                                color: Colors.white, fontSize: 17.0,)
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

  void sigUpUser() async {
    setState(() {
      pr.show();
    });
    var id;
    dynamic _firstname = firstnameController.text;
    dynamic _secondname = secondnameController.text;
    dynamic _email = emailController.text;
    dynamic _password = passwordController.text;
    dynamic _services = servicesController.text;
    dynamic _location = locationController.text;


    final User user = (await auth.createUserWithEmailAndPassword(
        email: _email, password: _password))
        .user;

    if(user!=null){
      setState(() {
        pr.hide();
      });
      await user.updateProfile(displayName: _firstname);
      id = user.uid;
      firestoreInstance.collection("agents").doc(id).set(
          {
            "firstname" : _firstname,
            "secondname" : _secondname,
            "email" : _email,
            "password" : _password,
            "services" : _services,
            "location" : _location,


          });
      final user1 = auth.currentUser;
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return DetailsSignup(user:user1);
      })
      );
    }
  }

  void openMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PlacePicker(
            apiKey: "AIzaSyACm1zfEZtKj78i47eKVaru5Pc3HI2refA",
            initialPosition: SignUp.kInitialPosition,
            useCurrentLocation: true,
            selectInitialPosition: true,

            //usePlaceDetailSearch: true,
            onPlacePicked: (result) {
              selectedPlace = result;
              Navigator.of(context).pop();
              setState(() {});
            },
            //forceSearchOnZoomChanged: true,
            //automaticallyImplyAppBarLeading: false,
            //autocompleteLanguage: "ko",
            //region: 'au',
            //selectInitialPosition: true,
            // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
            //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
            //   return isSearchBarFocused
            //       ? Container()
            //       : FloatingCard(
            //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
            //           leftPosition: 0.0,
            //           rightPosition: 0.0,
            //           width: 500,
            //           borderRadius: BorderRadius.circular(12.0),
            //           child: state == SearchingState.Searching
            //               ? Center(child: CircularProgressIndicator())
            //               : RaisedButton(
            //                   child: Text("Pick Here"),
            //                   onPressed: () {
            //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
            //                     //            this will override default 'Select here' Button.
            //                     print("do something with [selectedPlace] data");
            //                     Navigator.of(context).pop();
            //                   },
            //                 ),
            //         );
            // },
            // pinBuilder: (context, state) {
            //   if (state == PinState.Idle) {
            //     return Icon(Icons.favorite_border);
            //   } else {
            //     return Icon(Icons.favorite);
            //   }
            // },
          );
        },
      ),
    );
  }
}



