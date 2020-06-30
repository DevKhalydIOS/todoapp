import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleNotifier extends ChangeNotifier {
  GoogleSignInAccount _currentUser;

  @deprecated
  set user(GoogleSignInAccount u) => _currentUser = u;

  ///This getter can be null
  GoogleSignInAccount get user => _currentUser ?? null;

  ///When the user make a signOut
  void signOutUserGoogle() {
    _currentUser = null;
    notifyListeners();
  }

  void signInUserGoogle(GoogleSignInAccount u) {
    _currentUser = u;
    notifyListeners();
  }
}
