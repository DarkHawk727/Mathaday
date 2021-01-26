import 'package:firebase_auth/firebase_auth.dart';
import 'package:mathaday_app/firestore.dart';
import 'package:mathaday_app/userdata.dart';

class FirebaseUser{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      await firebaseAuth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }
}