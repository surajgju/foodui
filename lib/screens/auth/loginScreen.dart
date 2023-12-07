import 'package:flutter/material.dart';
import 'package:qconnect/screens/auth/forgetPwScreen.dart';

import '../../const/colors.dart';
import 'forgetPwScreen.dart';
import 'signUpScreen.dart';
import '../../utils/helper.dart';
import '../../widgets/customTextInput.dart';
import '../home/homeScreen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [

                Text(
                  "Login",
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                // Text('Add your details to login'),
                // Spacer(),
                CustomTextInput(
                  hintText: "Your email",
                ),
                Spacer(),
                CustomTextInput(
                  hintText: "password",
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

                    },
                    child: Text("Login"),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: Text("Forget your password?"),
                ),
                Spacer(
                  flex: 2,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(

                        BorderSide(
                         color: Colors.black38
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(

                        Color(
                          0xFFffffff,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            Helper.getAssetName(
                              "fb.png",
                              "virtual",
                            ),
                            width: 18,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Continue with Facebook",style: TextStyle(color: Colors.black38),)
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(
                          0xFF4285F4,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),

                          child: Image.asset(
                            Helper.getAssetName(
                              "google.png",
                              "virtual",
                            ),
                            width: 15,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text("Continue with Google")
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account?"),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
