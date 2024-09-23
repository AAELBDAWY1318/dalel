import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/services/locator_service.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  locatorService();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite,
      ),
    );
  }
}
