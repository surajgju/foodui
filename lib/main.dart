//author: Suraj Singh
//In case of any issue you can contact to developer at below details
//email: Suraj7370@icloud.com
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qconnect/provider/authProvider.dart';
import 'package:qconnect/provider/cart.dart';
import 'package:qconnect/provider/checkoutProvider.dart';
import 'package:qconnect/provider/featuredCategoriesProvider.dart';
import 'package:qconnect/provider/featuredRestaurantCategoriesProvider.dart';
import 'package:qconnect/provider/homeScreenProvider.dart';
import 'package:qconnect/provider/menuProvider.dart';
import 'package:qconnect/provider/onBoardingProvider.dart';
import 'package:qconnect/provider/ordersProviders.dart';
import 'package:qconnect/provider/searchProvider.dart';
import 'package:qconnect/screens/auth/changeAddressScreen.dart';
import 'package:qconnect/screens/food/foodHomeScreen.dart';
import 'package:qconnect/screens/food/offerHomeScreen.dart';
import 'package:qconnect/screens/food/restaurantDetailViewScreen.dart';
import 'package:qconnect/screens/food/restaurantListingScreen.dart';
import 'package:qconnect/screens/search/search_screen.dart';
import 'package:qconnect/screens/tracking/locationTracking.dart';
import 'package:qconnect/screens/tracking/order_status.dart';
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
  //ChuckerFlutter.showOnRelease = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>OnBoardingProvider()),
        ChangeNotifierProvider(create: (_)=>AuthProvider()),
        ChangeNotifierProvider(create: (_)=>MenuProvider()),
        ChangeNotifierProvider(create: (_)=>FeaturedCategoriesProvider()),
        ChangeNotifierProvider(create: (_)=>Cart()),
        ChangeNotifierProvider(create: (_)=>Orders()),
        ChangeNotifierProvider(create: (_)=>FeaturedRestaurantCategoriesProvider()),
        ChangeNotifierProvider(create: (_)=>CheckoutProvider()),
        ChangeNotifierProvider(create: (_)=>SearchProvider()),
        ChangeNotifierProvider(create: (_)=>HomeScreenProvider()),
      ],
      child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.white12,
    statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qconnect',
      debugShowCheckedModeBanner: false,
     // navigatorObservers: [ChuckerFlutter.navigatorObserver],
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
      routes: {
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
        DeliveryStatus.routeName:(context)=>DeliveryStatus(),
        OrderStatus.routeName:(context)=>OrderStatus(),
        SearchScreen.routeName:(context)=>SearchScreen(),
        RestaurantDetailViewScreen.routeName:(context)=>RestaurantDetailViewScreen(),
        RestaurantListingScreen.routeName:(context)=>RestaurantListingScreen()
      },
    );
  }
}
