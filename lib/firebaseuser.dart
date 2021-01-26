import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignIn{
  Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }
}