import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


 // Stream<User?> get authState => _firebaseAuth.authStateChanges();


  Future<User?> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Return the signed-in user
    } catch (e) {
      print('Sign-In Error: $e');
      rethrow; // Re-throw the error to handle it at a higher level
    }
  }




  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email ,password: password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Sign-out method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
