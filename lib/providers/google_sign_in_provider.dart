import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  //User logged
  GoogleSignInAccount _currentUser;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      //Aceess to:
      'email',
    ],
  );

  Future<GoogleSignInAccount> signOut() async => await  _googleSignIn.disconnect();
  
  //This could  return null
  GoogleSignInAccount get currentUser => _currentUser;

  ///This could  return null
  Future<GoogleSignInAccount> get signIn async {
    GoogleSignInAccount _user = await _googleSignIn.signIn();

    if (_user != null) _currentUser = _user;

    return _currentUser ?? null;
  }

  Future<GoogleSignInAccount> get signInSilently async =>
      await _googleSignIn.signInSilently();

  Future<bool> get isSignedIn async => await _googleSignIn.isSignedIn();

  ///Listeanble
  Stream<GoogleSignInAccount> get userCurrently =>
      _googleSignIn.onCurrentUserChanged;

  @override
  String toString() => _googleSignIn.toString();

}
