import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:fruithero/model/user.dart';
import 'package:fruithero/services/database.dart';
import 'package:fruithero/pages/myHome.dart';

class AuthService {
  final dynamic nickNamesofUser;
  AuthService({this.nickNamesofUser});
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void homeTransporter(uid){
   dynamic homeTransport = uid;
   Home(userUid: homeTransport,);
  }
  
  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //storing user uid
      homeTransporter(user.uid);
      //create new document for user with the uid
      await DataBaseServices(uid: user.uid).createDocumentWithUid(nickNamesofUser);
      //await DatabaseService(uid: user.uid).updateUserData(nickNamesofUser);
      return _userFromFirebaseUser(user);
    } catch (error) {
      return null;
    } 
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}