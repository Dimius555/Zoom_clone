import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoom/data/data_sources/local/app_storage.dart';
import 'package:zoom/domain/models/app_user.dart';
import 'package:zoom/utils/extensions/app_exceptions.dart';

class ClientAPI {
  final AppStorage appStorage;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ClientAPI({required this.appStorage});

  Future<AppUser> fetchUser() async {
    try {
      final userID = appStorage.fetchUserID();
      final snapshot = await _firestore.collection('users').doc(userID).get();
      if (snapshot.data() != null) {
        final user = AppUser.fromJson(snapshot.data()!);
        log('😀😀😀 User: ${user.toJson()}');
        return user;
      } else {
        throw FirestoreException(message: "User doesn't exist.");
      }
    } catch (e) {
      rethrow;
    }
  }
}
