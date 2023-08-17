
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../screens/home/homeScreen.dart';
import '../screens/initial/introScreen.dart';
import 'featuredCategoriesProvider.dart';

class OnBoardingProvider extends ChangeNotifier{
  // FoodMainScreenProvider();

  isUserLoggedin(context){
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if(uid != null){

      getData(context);
      Future.delayed(Duration(seconds: 1),()=>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
      // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }else{
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
    }
  }
  getData(context){
    Provider.of<FeaturedCategoriesProvider>(context,listen: false).
    getFeaturedFoodCategories("FozfU8xnLe6kvbluyDNN");
    Provider.of<FeaturedCategoriesProvider>(context,listen: false).
    getFeaturedFoodCategories2("Z65vGcmjCcxTt93BHUnD");
  }
}