import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/featuers/auth/data/services/firebase_auth_service.dart';
import 'package:fit_flow/featuers/auth/ui/cubit/auth_cubit_cubit.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_tab_switcher.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/fit_flow_logo.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/social_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../data/repo/auth_repo.dart';
import '../widgets/login_page.dart';
import '../widgets/signup_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  void _switchTab(bool isLogin) {
    if (_isLogin == isLogin) return;
    setState(() => _isLogin = isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitCubit(
        authRepo: FirebaseAuthRepoImpl(
          firebaseAuthService: FirebaseAuthService(FirebaseAuth.instance),
        ),
      ),
      child: BlocListener<AuthCubitCubit, AuthCubitState>(
        listener: (context, state) async {
          if (state is AuthCubitError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is AuthCubitSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Operation Successful!'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Navigate to onboarding
            context.go('/onboarding');
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryLight,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  const FitFlowLogo(),
                  const SizedBox(height: 36),
                  const SizedBox(height: 28),
                  _isLogin
                      ? const LoginPage(key: ValueKey('login'))
                      : const SignupPage(key: ValueKey('signup')),
                  const SizedBox(height: 32),
                  AuthTabSwitcher(
                    isLogin: _isLogin,
                    onLoginTap: () => _switchTab(true),
                    onSignupTap: () => _switchTab(false),
                  ),
                  const SizedBox(height: 32),
                  SocialRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
