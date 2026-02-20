import 'package:fit_flow/app_widgets.dart';
import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_tab_switcher.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/fit_flow_logo.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              // ── Logo ──
              const FitFlowLogo(),
              const SizedBox(height: 36),

              // ── Tab Switcher ──
              AuthTabSwitcher(
                isLogin: _isLogin,
                onLoginTap: () => _switchTab(true),
                onSignupTap: () => _switchTab(false),
              ),
              const SizedBox(height: 28),

              // ── Auth Card (no animation) ──
              _isLogin
                  ? const LoginPage(key: ValueKey('login'))
                  : const SignupPage(key: ValueKey('signup')),

              const SizedBox(height: 32),

              // ── Divider ──
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white.withOpacity(0.15))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.white.withOpacity(0.15))),
                ],
              ),

              const SizedBox(height: 24),

              // ── Social Buttons ──
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(icon: Icons.g_mobiledata, onTap: () {}),
                  const SizedBox(width: 16),
                  SocialLoginButton(icon: Icons.apple, onTap: () {}),
                  const SizedBox(width: 16),
                  SocialLoginButton(icon: Icons.facebook, onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
