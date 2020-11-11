import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        //iff error of snapshot
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text(
                    " Firebase initialised"
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text("Initialising app"),
          ),
        );
      },
    );
  }
}