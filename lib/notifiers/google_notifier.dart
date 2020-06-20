import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleNotifier extends ChangeNotifier {

  GoogleSignInAccount _currentUser;

  set user(GoogleSignInAccount u) => _currentUser = u;
  GoogleSignInAccount get user => _currentUser ?? null;


  //When the user make a signOut
  void makeNullUserGoogle() => _currentUser = null;
  
}
