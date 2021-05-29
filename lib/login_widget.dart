import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    print(user.email);
    print(user.photoURL);
    return Center(child: Text("LoggedIn ="+user.displayName),);
  }
}
