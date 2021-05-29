import 'package:flutter/material.dart';
import 'package:fourth/basewidgets.dart';
import 'package:fourth/g_sign_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class FbLoginScreen extends StatefulWidget {
  const FbLoginScreen({Key key}) : super(key: key);

  @override
  _GSignInScreenState createState() => _GSignInScreenState();
}

class _GSignInScreenState extends State<FbLoginScreen> {

  bool _isLoggedIn = false;
  Map _userObj  = {};
  GoogleSignIn _googleSignIn = GoogleSignIn();


  GSignController controller = GSignController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body:Container(
            child: _isLoggedIn ? Column(
              children: [

                Image.network(_userObj["picture"]["data"]["url"]),
                Text(_userObj["name"]),
                Text(_userObj["email"]),
                TextButton(onPressed: (){

                  FacebookAuth.instance.logOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                      _userObj = {};

                    });

                  });

                }, child: Text("Log out"))
              ],
            ):
            Obx(()=> Center(child: ElevatedButton(
              child: controller.showProgress.value?BaseWidgets.getProgressBar:Text("Login with fb"),
              onPressed: () async{



                FacebookAuth.instance.login(
                  permissions: ["public_profile","email"]
                ).then((value){

                  FacebookAuth.instance.getUserData().then((userData){

                    setState(() {
                      controller.showProgress.value = false;
                           _userObj = userData;
                      print(_userObj["email"]);
                      _isLoggedIn = true;

                    });
                  });
                });



                // _googleSignIn.signIn().then((userData){
                //   setState(() {
                //     _isLoggedIn = true;
                //     _userObj = userData;
                //     //  showProgress=false;
                //     controller.showProgress.value = false;
                //
                //   });
                //
                // }).catchError((e){
                //   print(e);
                // });
              },
            ),))
        )
    ));
  }


}
