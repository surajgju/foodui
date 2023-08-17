import 'package:flutter/material.dart';

loadingWidget(context, bool show) {
  return WidgetsBinding.instance.addPostFrameCallback((_)async {
    // Future.delayed(Duration(seconds: 8), () {
    //   Navigator.of(context).pop();
    // });
    if(show){

    await  showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return GestureDetector(
            onDoubleTap: (){
              Navigator.of(context).pop();
            },
            child: AlertDialog(
              elevation: 0,
              content: new Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  CircularProgressIndicator(),
                  Image.asset(
                    "assets/images/virtual/loading.gif",
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Loading...")),
                ],
              ),
            ),
          );
        });
    }else{
      Navigator.of(context).pop();
    }
  });
}
