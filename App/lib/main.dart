import 'dart:ui';

import 'package:app/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'getx/app_pages.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_screen.dart';
import 'theme/app_images.dart';
import 'network/network_controller.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initServices();
  Get.put(ThemeController());
  runApp(MyApp());
}

Future<void> initServices() async {
  Get.put<ConnectivityService>(ConnectivityService());
}

class SecureScreenObserver extends StatefulWidget {
  final Widget child;
  const SecureScreenObserver({super.key, required this.child});

  @override
  _SecureScreenObserverState createState() => _SecureScreenObserverState();
}

class _SecureScreenObserverState extends State<SecureScreenObserver> with WidgetsBindingObserver {
  bool _isAppInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _isAppInBackground = (state == AppLifecycleState.paused || state == AppLifecycleState.inactive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          if (_isAppInBackground)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white.withOpacity(0.8),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      AppImages.appLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController controller = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return SecureScreenObserver(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wag A Meal',
        theme: controller.currentTheme,
        initialBinding: SplashBinding(),
        home: const SplashScreen(),
        getPages: AppPages.pages,
      ),
    );
  }
}
