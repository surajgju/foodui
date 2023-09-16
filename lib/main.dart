import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodui/provider/authProvider.dart';
import 'package:foodui/provider/cart.dart';
import 'package:foodui/provider/checkoutProvider.dart';
import 'package:foodui/provider/featuredCategoriesProvider.dart';
import 'package:foodui/provider/featuredRestaurantCategoriesProvider.dart';
import 'package:foodui/provider/foodMainScreenProvider.dart';
import 'package:foodui/provider/menuProvider.dart';
import 'package:foodui/provider/onBoardingProvider.dart';
import 'package:foodui/provider/ordersProviders.dart';
import 'package:foodui/screens/auth/changeAddressScreen.dart';
import 'package:foodui/screens/food/foodHomeScreen.dart';
import 'package:foodui/screens/food/offerHomeScreen.dart';
import 'package:foodui/screens/food/restaurantDetailViewScreen.dart';
import 'package:foodui/screens/offers/offersMainHomeScreen.dart';
import 'package:foodui/screens/tracking/locationTracking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screens/initial/spashScreen.dart';
import 'screens/initial/landingScreen.dart';
import 'screens/auth/loginScreen.dart';
import 'screens/auth/signUpScreen.dart';
import 'screens/auth/forgetPwScreen.dart';
import 'screens/auth/sentOTPScreen.dart';
import './screens/newPwScreen.dart';
import 'screens/initial/introScreen.dart';
import 'screens/home/homeScreen.dart';
import 'screens/food_categories/menuScreen.dart';
import './screens/moreScreen.dart';
import 'screens/auth/profileScreen.dart';
import './screens/dessertScreen.dart';
import './screens/individualItem.dart';
import 'screens/orders/paymentScreen.dart';
import './screens/notificationScreen.dart';
import 'screens/auth/aboutScreen.dart';
import './screens/inboxScreen.dart';
import 'screens/orders/myOrderScreen.dart';
import 'screens/orders/checkoutScreen.dart';
import './const/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>OnBoardingProvider()),
        ChangeNotifierProvider(create: (_)=>FoodMainScreenProvider()),
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
        ChangeNotifierProvider(create: (_)=>MenuProvider()),
        ChangeNotifierProvider(create: (_)=>FeaturedCategoriesProvider()),
        ChangeNotifierProvider(create: (_)=>Cart()),
        ChangeNotifierProvider(create: (_)=>Orders()),
        ChangeNotifierProvider(create: (_)=>FeaturedRestaurantCategoriesProvider()),
        ChangeNotifierProvider(create: (_)=>CheckoutProvider()),

      ],
      child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white12,
    statusBarIconBrightness: Brightness.dark,
    ),
    // Replace "Colors.blue" with your desired color
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qconnect',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.openSans().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Color(0xFF3cb44c) ),
        scaffoldBackgroundColor: Colors.white,
        // dialogBackgroundColor: Colors.white,
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          contentTextStyle: TextStyle(color: Colors.black45)
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.white10,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.green,
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(color: AppColor.primary,fontSize: 14,fontWeight: FontWeight.normal),
          titleSmall: TextStyle(color: AppColor.primary,fontSize: 12,fontWeight: FontWeight.normal),
          titleLarge: TextStyle(color: AppColor.primary,fontSize: 20,fontWeight: FontWeight.normal),

        ),

      ),
      home: SplashScreen(),
     //home:HomeScreen(),
      routes: {
      //  LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
        MyOrderScreen.routeName: (context) => MyOrderScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
        FoodHomeScreen.routeName:(context)=>FoodHomeScreen(),
        OfferHomeScreen.routeName:(context)=>OfferHomeScreen(),
        MyMaps.routeName:(context)=>MyMaps(),

        RestaurantDetailViewScreen.routeName:(context)=>RestaurantDetailViewScreen()
      },
    );
  }
}
