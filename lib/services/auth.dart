import 'package:firebase_auth/firebase_auth.dart';

//TODO -- user agreement -> see flutterfire phone auth
//TODO 2 -- setup phone auth for ios

enum CodeSendingState {
  invalidPhoneCodeNotSent,
  codeNotSentFirebaseErr,
  codeNotSentExceptionRaised,
  codeSent,
  codeSentResolveTimeout,
}

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final userStream = FirebaseAuth.instance.authStateChanges();

  final user = FirebaseAuth.instance.currentUser;

  Future<bool> signInWithCode(String smsCode, String? verificationId) async {
        try{
          if(verificationId == null)return false;
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
          return true;
        }catch(e){
          return false;
        }
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      int? resendToken,
      Function(CodeSendingState authState,
              {String? verificationId, int? resendToken})
          callback) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) async { 
          // ANDROID ONLY!
          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            callback(CodeSendingState.invalidPhoneCodeNotSent);
          }
          // Handle other errors
          callback(CodeSendingState.codeNotSentFirebaseErr);
        },
        codeSent: (String verificationId, int? resendToken) async {

          callback(CodeSendingState.codeSent,
              verificationId: verificationId, resendToken: resendToken);
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
          callback(CodeSendingState.codeSentResolveTimeout);
        },
      );
    } catch (e) {
      callback(CodeSendingState.codeNotSentExceptionRaised);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
