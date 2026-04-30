import 'package:fit_flow/core/routing/app_routing.dart';
import 'package:fit_flow/core/utils/flavor_config.dart';
import 'package:fit_flow/core/utils/di_helper.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await mainCommon(Flavor.prod);
}

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.setFlavor(flavor);
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await setupDependencies();
  runApp(const FitFlowApp());
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.appName,
      debugShowCheckedModeBanner: !FlavorConfig.isProduction,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      routerConfig: AppRouting.router,
    );
  }
}

