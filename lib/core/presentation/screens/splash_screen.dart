import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFFFC),
      body: Center(
        child: Image(image: AssetImage('assets/images/logo_hd.png')),
      ),
    );
  }

  Future<void> _initializeApp() async {
    // يمكنك إضافة المزيد من عمليات التهيئة هنا إذا لزم الأمر
    // if (await isSafeDevice()) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MainScreen()),
    //   );
    // } else {
    //   SystemNavigator.pop();
    // }
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const MainScreen()),
    // );
  }

  // Future<bool> isSafeDevice() async {
  //   final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
  //   final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
  //   final isOnExternalStorage =
  //       await JailbreakRootDetection.instance.isOnExternalStorage;

  //   if (isOnExternalStorage || !isRealDevice || isJailBroken) return false;

  //   return true;
  // }
}
