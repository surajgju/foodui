import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qconnect/const/colors.dart';
import 'package:qconnect/utils/helper.dart';
import 'package:qconnect/widgets/customNavBar.dart';
import 'package:qconnect/widgets/customTextInput.dart';
import '../../widgets/navigate_back_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: back(context),
        title:  Text(
          "Profile",
          style: Helper.getTheme(context).headline5,
        ),
        // actions: [ Image.asset(
        //   Helper.getAssetName("cart.png", "virtual"),
        //   scale: 5,
        // )],
      ),
      body: SafeArea(
        child: Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ClipOval(
                    child: Stack(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            Helper.getAssetName(
                              "pic_passport.jpeg",
                              "real",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 80,
                            color: Colors.black.withOpacity(0.3),
                            child: Image.asset(Helper.getAssetName(
                                "camera.png", "virtual")),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Image.asset(
                  //       Helper.getAssetName("edit_filled.png", "virtual"),
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Text(
                  //       "Edit Profile",
                  //       style: TextStyle(color: AppColor.green),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hi there Suraj!",
                    style: Helper.getTheme(context).headline4?.copyWith(
                          color: AppColor.primary,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text("Sign Out"),
                  SizedBox(
                    height: 40,
                  ),
                  CustomFormImput(
                    label: "Name",
                    value: "Suraj Singh",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormImput(
                    label: "Email",
                    value: "Suraj160110@email.com",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormImput(
                    label: "Mobile No",
                    value: "+918168673754",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormImput(
                    label: "Address",
                    value: "No 23, 6th Lane, Colombo 03",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormImput(
                    label: "Password",
                    value: "Emilia Clarke",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormImput(
                    label: "Confirm Password",
                    value: "Emilia Clarke",
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  //   height: 50,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Text("Save"),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key? key,
    String? label,
    String? value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String? _label;
  final String? _value;
  final bool? _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword!,
        initialValue: _value,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
