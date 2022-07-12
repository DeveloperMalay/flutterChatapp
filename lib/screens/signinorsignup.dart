import 'package:chatapp/constant/routes.dart';
import 'package:flutter/material.dart';

class SignInOrSignUp extends StatelessWidget {
  const SignInOrSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  height: 50,
                  width: 350,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, signInRoute, (route) => false);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                            side: const BorderSide(color: Colors.green)),
                      ),
                    ),
                    child: const Text(
                      'SignIn',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, signUpRoute, (route) => false);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                          side: const BorderSide(color: Colors.green)),
                    ),
                  ),
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
