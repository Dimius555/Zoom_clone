import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/domain/models/app_user.dart';

class AuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool checkAuthorisation() {
    return _auth.currentUser != null;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
      final OAuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credentials);
      User? user = userCredential.user;

      if (user != null && userCredential.additionalUserInfo != null && userCredential.additionalUserInfo!.isNewUser) {
        await _saveNewUserToFirestore(user);
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> _saveNewUserToFirestore(User user) async {
    await _firestore.collection('users').doc(user.uid).set(AppUser.convertFirebaseUser(user).toJson()).then((value) {
      log('Authorized and saved new user');
    });
  }
}
