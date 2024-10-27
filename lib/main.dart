import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/shareController.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp();
  ShareController shareController = Get.put(ShareController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: DependenciesBinding(),
      initialRoute: AppRouter.SPLASH_PAGE,
      getPages: AppRouter.listGetPage,
    );
  }
}

class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}