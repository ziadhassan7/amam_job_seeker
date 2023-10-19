import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  ///                                                                           / Auth
  //Login
  Future<void> login({
    required String email,
    required String password}) async {

    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //Register
  Future<void> registerUser({
    required String name,
    required String email,
    required String password}) async {

    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await updateDisplayName(name);
  }

  //Logout
  Future<void> logout({
    required String email,
    required String password}) async {

    await _firebaseAuth.signOut();
  }

  ///                                                                           / User - Name
  //update display name
  Future<void> updateDisplayName(String name) async {
    if(currentUser != null){
      await currentUser!.updateDisplayName(name);
    }
  }

  //Get display name
  get displayName => (currentUser != null)? currentUser!.displayName : "";


  ///                                                                           / User - Email
  //update email
  Future<void> updateUserEmail(String email) async {
    if(currentUser != null){
      await currentUser!.updateEmail(email);
    }
  }

  //Get user email
  get userEmail => (currentUser != null) ? currentUser!.email : "";
}