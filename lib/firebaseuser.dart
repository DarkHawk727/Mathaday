import 'package:firebase_auth/firebase_auth.dart';

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