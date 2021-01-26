import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllQuestions(){
    return instance.collection('questions').get().then((QuerySnapshot querySnapshot){
      return querySnapshot.docs.map((e) => e.data()).toList();
    });
  }

  Future<Map<String, dynamic>> getUserData(User user){
    return instance.collection('users').doc(user.uid).get().then((DocumentSnapshot querySnapshot){
      return querySnapshot.data();
    });
  }

  Future<void> setData(data, String collection, String doc) {
    instance.collection(collection).doc(doc).set(data, SetOptions(merge: true));
  }
}