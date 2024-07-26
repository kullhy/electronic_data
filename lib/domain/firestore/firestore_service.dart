import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_data/domain/models/user.dart';
 // Import the User model

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(User user) async {
    await _db.collection('users').doc(user.id).set(user.toJson());
  }

  Future<User?> getUser(String email) async {
    final querySnapshot = await _db.collection('users').where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      return User.fromJson(querySnapshot.docs.first.data());
    }
    return null;
  }
}