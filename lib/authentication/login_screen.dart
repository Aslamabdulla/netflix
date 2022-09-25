import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/main_page/screen_main_page.dart';

import 'helpers/biometric_helpers.dart';

class LoginAuthentication extends StatefulWidget {
  const LoginAuthentication({super.key});

  @override
  State<LoginAuthentication> createState() => _LoginAuthenticationState();
}

class _LoginAuthenticationState extends State<LoginAuthentication> {
  bool showBiometrics = false;
  bool isAuthenticate = false;
  @override
  void initState() {
    super.initState();
    isBiometricAvailable();
  }

  isBiometricAvailable() async {
    showBiometrics = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/580b57fcd9996e24bc43c529.png",
              height: 100,
              width: 150,
            ),
            kHeight50,
            const Text(
              "PLEASE VERIFY YOUR BIOMETRICS TO USE APP",
              style: TextStyle(fontSize: 12),
            ),
            kHeight50,
            const Icon(
              Icons.fingerprint,
              color: Colors.grey,
              size: 100,
            ),
            kHeight50,
            if (showBiometrics)
              TextButton.icon(
                label: const Text(
                  "Login",
                  style: TextStyle(color: kWhiteColor, fontSize: 18),
                ),
                icon: const Icon(
                  Icons.login_outlined,
                  color: kWhiteColor,
                ),
                style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    backgroundColor: Colors.grey[900],
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        color: kWhiteColor)),
                onPressed: () async {
                  isAuthenticate = await BiometricHelper().authenticate();
                  if (isAuthenticate) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return ScreenMainPage();
                    }));
                  }
                },
              ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
