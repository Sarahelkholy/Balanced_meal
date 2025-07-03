import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Balanced Meal',
          theme: ThemeData(
            scaffoldBackgroundColor: Kbackground,
            iconTheme: const IconThemeData(color: Colors.black),
            primarySwatch: Colors.grey,
          ),
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
