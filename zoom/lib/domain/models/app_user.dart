import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  late String id;
  late String name;
  late String? email;
  late String? photoUrl;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  static AppUser convertFirebaseUser(User fbUser) {
    return AppUser(
      id: fbUser.uid,
      name: fbUser.displayName ?? 'New User',
      email: fbUser.email,
      photoUrl: fbUser.photoURL,
    );
  }

  static AppUser fromJson(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  static AppUser emptyUser() => AppUser(id: '', name: '', email: '', photoUrl: '');
}
