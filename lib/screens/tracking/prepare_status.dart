import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrepareStatus extends StatefulWidget {
  const PrepareStatus({super.key});

  @override
  State<PrepareStatus> createState() => _PrepareStatusState();
}

class _PrepareStatusState extends State<PrepareStatus> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return  Column(
      children: [
        SizedBox(height: 12.w,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 95.w,),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Order Status",
                    style: TextStyle(
                        height: 1,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                  Text(
                    "Invoice #3452",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Container(
                  width: 180.w,
                  padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: [
                          TextSpan(text:"Address : \n",
                              style: TextStyle(

                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black87)
                          ),
                          TextSpan(text:"B 8, Block B, Industrial Area, Sector 62, Noida, Uttar Pradesh 201309" ,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black87)
                          )

                        ]
                    ),
                  ),
                )
              ],),
              Column(children: [ Container(
                padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: [
                        TextSpan(text:"Pickup Person : \n",
                            style: TextStyle(

                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.black87)
                        ),
                        TextSpan(text:"Shayam Singh" ,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.black87)
                        )

                      ]
                  ),
                ),
              )],)
            ],
          ),
        ),
        Image.asset("assets/images/virtual/cooking.gif"),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 5, 8).r,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                children: [
                  TextSpan(text:"Your order has been received.\n",
                      style: TextStyle(

                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.black87)
                  ),
                  TextSpan(text:"Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.black87)
                  )

                ]
            ),
          ),
        ),

      ],
    );
  }
}
