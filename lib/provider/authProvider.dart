import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodui/screens/home/homeScreen.dart';
import 'package:foodui/utils/snackbar.dart';
import '../screens/auth/sentOTPScreen.dart';
import '../widgets/loading_widget.dart';

class AuthProvider extends ChangeNotifier {
  bool isMobile = true;
  bool enableOtp = false;
  bool enableProceed = false;
  String smsVerificationId = '';
  String smsCode = '';
  TextEditingController emailInputController = TextEditingController();
  TextEditingController mobileInputController =
      TextEditingController(text: "8168673754");
  TextEditingController firstOtp = TextEditingController();
  TextEditingController secondOtp = TextEditingController();
  TextEditingController thirdOtp = TextEditingController();
  TextEditingController fourthOtp = TextEditingController();
  TextEditingController fifthOtp = TextEditingController();
  TextEditingController sixthOtp = TextEditingController();

  varifyOtp(context) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    smsCode = firstOtp.text.trim() +
        secondOtp.text.trim() +
        thirdOtp.text.trim() +
        fourthOtp.text.trim() +
        fifthOtp.text.trim() +
        sixthOtp.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: smsVerificationId, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    if (credential != null) {
      final UserCredential userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);
      DocumentSnapshot user = await users.doc(userCred.user?.uid).get();

      if (user.data() == null ) {
        registerUser(userCred, users);
      }
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  loginWithPhone(context) async {
    loadingWidget(context, true);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + mobileInputController.text.trim(),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException exception) {
          loadingWidget(context, true);
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: Text(exception.message.toString()),
                );
              });
        },
        codeSent: (String? verificationId, int? resendCode) {
          successToast("Otp sent");

          Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);
          smsVerificationId = verificationId!;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(
              "************************** codeAutoRetrievalTimeout $verificationId**************************");
        });
  }

  registerUser(UserCredential userCred, CollectionReference users) async {
    await users
        .add({
          'uid': userCred.user?.uid,
          'displayName': randomString(),
          'phoneNumber': userCred.user?.phoneNumber,
          'profileImage':
              'https://i.pravatar.cc/300?u=${userCred.user?.phoneNumber}'
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

randomString() {
  final random = Random();
  const availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final randomString = List.generate(
          8, (index) => availableChars[random.nextInt(availableChars.length)])
      .join();

  return randomString;
}
