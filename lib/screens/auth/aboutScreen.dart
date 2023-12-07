import 'package:flutter/material.dart';
import 'package:qconnect/const/colors.dart';
import 'package:qconnect/utils/helper.dart';
import 'package:qconnect/widgets/customNavBar.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/aboutScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "About Us",
                      style: Helper.getTheme(context).headline5,
                    ),
                  ),
                  Image.asset(
                    Helper.getAssetName("cart.png", "virtual"),
                    scale: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  AboutCard(),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColor.green,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "Welcome to QConnect, your premier destination for swift and delectable food delivery! At QConnect, we're passionate about connecting you with a diverse array of culinary experiences. Our mission is simple: to bring the finest flavors right to your doorstep. With a commitment to speed, quality, and exceptional service, we partner with local eateries to deliver a seamless dining experience. Whether you crave comfort classics, exotic cuisines, or health-conscious options, QConnect has you covered. Join us on a journey of culinary delight as we redefine the way you savor every bite. Your satisfaction is our priority, and we're delighted to be your go-to food delivery choice!",
              style: TextStyle(
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
