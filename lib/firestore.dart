import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "dart:math";
import 'package:mathaday_app/userdata.dart';

class Database {
  FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    List<Map<String, dynamic>> questions = [];
    List<int> grades = [5,6,7,8,9,10,12];

    while (questions.length < 3) {
      if(grades.length == 0) break;
      int grade = grades[Random().nextInt(grades.length)];
      await instance.collection('questions').where('grade', isEqualTo: grade).limit(3).get().then((QuerySnapshot querySnapshot){
        questions = querySnapshot.docs.map((e) {
          Map<String, dynamic> _data = e.data();
          _data.addAll({'id': e.id});
          return _data;
        }).toList();
        questions.removeWhere((element) => userData.previousQuestions.contains(element));
      });
      grades.remove(grade);
    }
    return questions;
  }

  Future<Map<String, dynamic>> getUserData(User user){
    return instance.collection('users').doc(user.uid).get().then((DocumentSnapshot querySnapshot){
      return querySnapshot.data();
    });
  }

  Future<void> setData(data, String collection, String doc) {
    return instance.collection(collection).doc(doc).set(data, SetOptions(merge: true));
  }
}