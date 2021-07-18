import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:allskills/models/UserProfile.dart';

class FirestoreApi {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('usersPublic');

  Future<UserProfile?> getUser({required String userId}) async {
    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        return null;
      }

      final userData = userDoc.data();

      return UserProfile.fromData(userData as Map<String, dynamic>);
    }
  }
}
