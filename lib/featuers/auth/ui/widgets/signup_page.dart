import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_button.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_header.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          )
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AuthSectionHeader(
            title: 'Sign Up!',
            subtitle: 'Create your new account.',
          ),
          const SizedBox(height: 20),
          const AppTextField(hint: 'Full Name'),
          const SizedBox(height: 12),
          const AppTextField(
            hint: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          const AppTextField(
            hint: 'Password',
            obscure: true,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  value: _agreed,
                  onChanged: (v) => setState(() => _agreed = v ?? false),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  activeColor: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: AppColors.textGrey, fontSize: 12),
                    children: [
                      TextSpan(text: 'I agree the '),
                      TextSpan(
                        text: 'Terms & Privacy Policy',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          AuthButton(
            label: 'CREATE ACCOUNT',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
