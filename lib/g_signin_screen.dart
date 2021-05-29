import 'package:flutter/material.dart';
import 'package:fourth/basewidgets.dart';
import 'package:fourth/g_sign_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GSignInScreen extends StatefulWidget {
  const GSignInScreen({Key key}) : super(key: key);

  @override
  _GSignInScreenState createState() => _GSignInScreenState();
}

class _GSignInScreenState extends State<GSignInScreen> {

  bool _isLoggedIn = false;
  GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();


  GSignController controller = GSignController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Container(
        child: _isLoggedIn ? Column(
          children: [
            Image.network(_userObj.photoUrl),
            Text(_userObj.displayName),
            Text(_userObj.email),
           // Text(_userObj)
            TextButton(onPressed: (){
              _googleSignIn.signOut().then((value){
                setState(() {
                  _isLoggedIn = false;
                });
              }).catchError((e){
                print(e);
              });
            }, child: Text("Log out"))
          ],
        ):
       Obx(()=> Center(child: ElevatedButton(
          child: controller.showProgress.value?BaseWidgets.getProgressBar:Text("Login with Google"),
          onPressed: (){
              // setState(() {
              //   showProgress = true;
              // });
              controller.showProgress.value = true;

            _googleSignIn.signIn().then((userData){
              setState(() {
                _isLoggedIn = true;
                _userObj = userData;
              //  showProgress=false;
                controller.showProgress.value = false;

              });

            }).catchError((e){
              print(e);
            });
          },
        ),))
      )
    ));
  }


}
