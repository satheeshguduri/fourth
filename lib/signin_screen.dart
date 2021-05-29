import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourth/signin_provider.dart';
import 'package:fourth/signup_widget.dart';
import 'package:provider/provider.dart';
import 'package:fourth/login_widget.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ChangeNotifierProvider(
        create: (context)=>GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

            if(provider.isSigningIn){
              return Text("loading..");
            }else if(snapshot.hasData){
              return LoggedInWidget();
            }
            return SignUpWidget();
          },
          ),
      ),
    ));
  }
}

