import '../model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthDataSource {
  Future<UserModel> login(String email, String password) async {
    try {
      // Firebase Auth se login
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Firestore se user data fetch karo
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user!.uid)
              .get();
      return UserModel.fromJson(doc.data() ?? {});
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<UserModel> signup(String name, String email, String password) async {
    try {
      // Firebase Auth mein user create karo
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        createdAt: DateTime.now(),
      );

      //Firestore mein user data save karo
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toJson());

      return user;
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      // Current user ko fetch karo
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) throw Exception('No user logged in');

      // Firestore se data fetch karo
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .get();

      return UserModel.fromJson(doc.data() ?? {});
    } catch (e) {
      throw Exception('Failed to get user: ${e.toString()}');
    }
  }
}
