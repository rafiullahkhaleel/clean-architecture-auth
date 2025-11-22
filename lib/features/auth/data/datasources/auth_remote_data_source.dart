import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<UserModel> signUp(String name, String email, String password) async {
    final cred = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final model = UserModel(id: cred.user!.uid, name: name, email: email);
    await firestore.collection("users").doc(model.id).set(model.toMap());
    return model;
  }

  Future<UserModel> login(String email, String password) async {
    final cred = await auth.signInWithEmailAndPassword(email: email, password: password);
    final doc = await firestore.collection("users").doc(cred.user!.uid).get();
    return UserModel.fromMap(doc.data()!);
  }

  Future<UserModel?> getCurrentUser() async {
    final user = auth.currentUser;
    if (user == null) return null;
    final doc = await firestore.collection("users").doc(user.uid).get();
    return UserModel.fromMap(doc.data()!);
  }
}
