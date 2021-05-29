import 'package:flutter/material.dart';
import 'package:fourth/signin_provider.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  ElevatedButton(
        child: Text("Google Sign In"),
        onPressed: (){
          print("working");

          final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
          provider.login();
        },
      ),
    );
  }
}
