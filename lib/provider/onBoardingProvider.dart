
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home/homeScreen.dart';
import '../screens/initial/introScreen.dart';
import 'featuredCategoriesProvider.dart';
import 'homeScreenProvider.dart';

class OnBoardingProvider extends ChangeNotifier{
final logger = Logger();
  isUserLoggedin(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = await prefs.getString("token");

    if(authToken != null && authToken.isNotEmpty){
      logger.i(authToken);
      getData(context);
      Future.delayed(Duration(seconds: 1),()=>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
      // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    return;
    }
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
  }
  getData(context)async{
   final featuredCategoriesProvider = Provider.of<FeaturedCategoriesProvider>(context,listen: false);
  final homeProvider =  Provider.of<HomeScreenProvider>(context,listen: false);
   await featuredCategoriesProvider.getMainFoodCategories();
  await featuredCategoriesProvider.getSpecialFoodCategories();
   homeProvider.getCurrentAddress();
   homeProvider.getMainBanners();
   featuredCategoriesProvider.getTopRestaurant();


  }
}