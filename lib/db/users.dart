import 'package:cloud_firestore/cloud_firestore.dart';
class UserServices{
  FirebaseFirestore _database = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map data) {
    //print(data['name']);
    _database.collection(collection).doc(data['userId']).set(data);
  }
}