import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatapp/constant/routes.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/signin_screen.dart';
// import 'package:chatapp/screens/signinorsignup.dart';
import 'package:chatapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatapp/mythems/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: AnimatedSplashScreen(
        splash: Center(
          child: Image.asset('assets/logo.png'),
        ),
        duration: 3000,
        // nextScreen: const SignInOrSignUp(),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.black,
        animationDuration: const Duration(seconds: 1),
      ),
      routes: {
        signInRoute: (context) => const SignInScreen(),
        signUpRoute: (context) => const SignUpScreen(),
      },
    );
  }
}
