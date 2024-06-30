import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:machine_test_zartek/app/helper/utils/utils.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';

class FireBaseAuthProvider {
  firebasePhoneAuth(String mobileNumber, Function(String) codeSent) {
    String phoneNumber = '+91$mobileNumber';
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        Utils.toastMessage("Error: ${error.message}");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyingPhoneAuth(
    String verifyId,
    String otp,
  ) async {
    try {
      final credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offNamed(Routes.SPLASH);
      Utils.toastMessage("Login Sucessfully");
    } catch (e) {
      Utils.toastMessage("Error: ${e.toString()}");
    }
  }

  Future<void> firebaseGoogleSignIn() async {
    final auth = FirebaseAuth.instance;
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await auth.signInWithCredential(credentials);
      Utils.toastMessage("Login Sucessfully");
      Get.offNamed(Routes.SPLASH);
    } catch (e) {
      Utils.toastMessage("Error: ${e.toString()}");
      return;
    }
  }
}
