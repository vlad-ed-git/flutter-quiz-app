import 'package:flutter/material.dart';
import 'package:quizme/components/btns/primary_btn.dart';
import 'package:quizme/components/btns/secondary_btn.dart';
import 'package:quizme/components/popups/snack.dart';
import 'package:quizme/components/regex/regex_used.dart';
import 'package:quizme/components/txt_fields/primary_txt_field.dart';
import 'package:quizme/services/auth.dart';
import 'package:quizme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

const phoneNumberPrefix = "+";

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';
  String verificationCode = '';
  String? phoneNumberErr;
  String? verificationCodeErr;
  int? resendCodeToken;
  String? verifiedId;
  CodeSendingState? loginState;
  bool isLoading = false;
  AuthService authService = AuthService();

  void onGetCodeClicked() {
    if (isLoading || phoneNumber.isEmpty) return;
    setState(() {
      isLoading = true;
    });
    authService
        .verifyPhoneNumber(phoneNumberPrefix + phoneNumber, resendCodeToken,
            (authState, {resendToken, verificationId}) {
      //callback
      setState(() {
        loginState = authState;
        if (loginState == CodeSendingState.invalidPhoneCodeNotSent ||
            loginState == CodeSendingState.codeNotSentFirebaseErr) {
          phoneNumberErr = 'Invalid phone number';
        } else if (loginState == CodeSendingState.codeNotSentExceptionRaised) {
          phoneNumberErr = 'Error occurred. Try again later';
        } else if (loginState == CodeSendingState.codeSent) {
          resendCodeToken = resendToken;
          verifiedId = verificationId;
          String snackMessage =
              "A verification code has been sent to your number";
          ScaffoldMessenger.of(context)
              .showSnackBar(Snack(content: snackMessage).create());
        }
        isLoading = false;
      });
    });
  }

  void onSignInClicked() async {
    if (isLoading || verificationCode.isEmpty) return;
    setState(() {
      isLoading = true;
    });
    bool isSuccess =
        await authService.signInWithCode(verificationCode, verifiedId);
    if (!isSuccess) {
      setState(() {
        verificationCodeErr = 'Incorrect verification code';
        isLoading = false;
      });
    }// else will login in & auto-redirect
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: appTheme.textTheme.headline6,),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Sign In To Get Started",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: PrimaryTxtField(
                  icon: Icons.phone_iphone,
                  labelTxt: "Phone Number",
                  hintTxt: "Your phone number",
                  prefixTxt: phoneNumberPrefix,
                  allowOnly: phoneNoRegex,
                  keyType: TextInputType.phone,
                  onTxtChanged: (val) {
                    setState(() {
                      phoneNumber = val;
                      verificationCodeErr = null;
                      phoneNumberErr = null;
                    });
                  },
                  error: phoneNumberErr,
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: PrimaryTxtField(
                      icon: Icons.dialpad,
                      labelTxt: "Verification Code",
                      allowOnly: verificationCodeRegex,
                      keyType: TextInputType.phone,
                      maxLen: 6,
                      onTxtChanged: (val) {
                        setState(() {
                          verificationCode = val;
                          verificationCodeErr = null;
                          phoneNumberErr = null;
                        });
                      },
                      error: verificationCodeErr,
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      child: SecondaryButton(
                        text: 'Get Code',
                        onClick: onGetCodeClicked,
                      ))
                ],
              ),
            ),
            Text(
              "Click GET CODE to receive a verification code via sms to your phone number. Standard rates may apply.",
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: PrimaryButton(
                icon: Icons.login,
                text: "Sign In",
                onClick: onSignInClicked,
              ),
            ),
            Visibility(
                visible: isLoading,
                child: const SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                        child: CircularProgressIndicator(
                      semanticsLabel: 'Login in progress',
                    )))),
            Text(
              "By Signing In, you are agreeing to our terms & conditions. Click this message to review them before proceeding.",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
