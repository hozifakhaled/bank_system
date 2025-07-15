import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup(); 
  // ✅ لازم يكون await لأن setup فيها Future
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
      title: 'Bank System',
     debugShowCheckedModeBanner: false,
      routerConfig:  AppRouting.router,
    ));
  }
}

