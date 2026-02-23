import 'package:fit_flow/featuers/auth/ui/views/auth_view.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:flutter/material.dart';
  import 'package:firebase_core/firebase_core.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();


await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const FitFlowApp());
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}

