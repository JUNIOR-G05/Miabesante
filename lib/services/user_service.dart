import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miabesante/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to register a new user
  Future<void> register(UserModel user) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('users').add(user.toMap());
      user.id = docRef.id;
      print('User registered successfully with ID: ${user.id}');
    } catch (e) {
      print(e);
    }
  }

  // Function to login a user
  Future<UserModel?> login(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('mdp', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        return UserModel.fromMap(
            userDoc.data() as Map<String, dynamic>, userDoc.id);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }


  // get doctor 
  Future<List<UserModel>> getDoctors() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('role', isEqualTo: 'DOCTEUR')
          .get();

      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
  
}
