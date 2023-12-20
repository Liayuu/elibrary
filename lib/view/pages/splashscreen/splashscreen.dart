import 'package:elibrary/themes/asset_dir.dart';
import 'package:elibrary/view/pages/home/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _next();
    super.initState();
  }

  _next() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Get.off(() => const MainMenu());
    });
  }

  // void _splashscreenStart() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Expanded(
              child: Image.asset(
                AssetsDirectory.mainLogo,
                scale: 1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Center(
            child: Text(
              "SELAMAT DATANG\nDI\nPERPUSTAKAAN",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
