import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllQuestions(){
    return instance.collection('questions').get().then((QuerySnapshot querySnapshot){
      return querySnapshot.docs.map((e) => e.data()).toList();
    });
  }
}