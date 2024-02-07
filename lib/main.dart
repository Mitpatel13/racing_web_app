import 'package:admin_racing/routes/app_route.dart';
import 'package:admin_racing/routes/biding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'backend/middleware/dio_middleware.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DioMiddleware(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      getPages: page().pages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.myHomePage,
    );
  }
}

