// import 'package:allskills/models/UserProfile.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:allskills/utils/firestore_api.dart';

// class UserService {
//   final _firestoreApi = FirestoreApi();
//   //final _firebaseAuthenticationService = FirebaseAuthenticationService();

//   UserProfile? _currentUser;

//   UserProfile get currentUser => _currentUser!;

//   bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

//   Future<void> syncUserAccount() async {
//     final firebaseUserId =
//         _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

//     final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

//     if (userAccount != null) {
//       _currentUser = userAccount;
//     }
//   }

//   Future<void> syncOrCreateUserAccount({required User user}) async {
//     await syncUserAccount();

//     if (_currentUser == null) {
//       await _firestoreApi.createUser(user: user);
//       _currentUser = user;
//     }
//   }
// }
