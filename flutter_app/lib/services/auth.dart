import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<int> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return 1;
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
      return 0;
    }
  }

  Future<int> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return 1;
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.message);
      return 0;
    }
  }
}
