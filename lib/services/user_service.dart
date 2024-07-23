import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miabesante/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to register a new user
  Future<void> register(UserModel user) async {
    try {
      DocumentReference docRef = await _firestore.collection('users').add(user.toMap());
      user.id = docRef.id;
      print('User registered successfully with ID: ${user.id}');
    } catch (e) {
      print(e);
    }
  }

  // Function to login a user
  Future<bool> login(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .where('mdp', isEqualTo: password)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
