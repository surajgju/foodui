import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodui/const/colors.dart';
import 'package:foodui/utils/helper.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:foodui/widgets/customNavBar.dart';
import 'package:foodui/widgets/searchBar.dart' as sb;
import 'package:provider/provider.dart';

import '../../provider/checkoutProvider.dart';

class ChangeAddressScreen extends StatelessWidget {
  static const routeName = "/changeAddressScreen";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Text(
                    "Change Address",
                    style: Helper.getTheme(context).headline5,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    child: Image.asset(
                      Helper.getAssetName(
                        "map.png",
                        "real",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 40,
                    child: Image.asset(
                      Helper.getAssetName(
                        "current_loc.png",
                        "virtual",
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 180,
                    child: Image.asset(
                      Helper.getAssetName(
                        "loc.png",
                        "virtual",
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      width: Helper.getScreenWidth(context) * 0.45,
                      decoration: ShapeDecoration(
                        color: AppColor.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Your Current Location",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            checkoutProvider.checkoutAddress,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    right: 205,
                    child: ClipPath(
                      clipper: CustomTriangleClipper(),
                      child: Container(
                        width: 30,
                        height: 30,
                        color: AppColor.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              sb.SearchBar(title : "Search Address",),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  _showAddressInputDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: AppColor.green.withOpacity(0.2),
                        ),
                        child: Icon(
                          Icons.add_location_alt,
                          color: AppColor.green,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Add Address manually",
                          style: TextStyle(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColor.green.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.star_rounded,
                        color: AppColor.green,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Choose a saved place",
                        style: TextStyle(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _showAddressInputDialog(BuildContext context) {
   // String enteredAddress = '';
    final checkoutProvider = Provider.of<CheckoutProvider>(context,listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Address Manually'),
          content: TextField(
            onChanged: (value) {
              checkoutProvider.checkoutAddress = value;
            },
            decoration: InputDecoration(labelText: 'Address'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Use the enteredAddress as needed
               // successToast("Address Added");
               // print('Entered Address: $enteredAddress');
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
