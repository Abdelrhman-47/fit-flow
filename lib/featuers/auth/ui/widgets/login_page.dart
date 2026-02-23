import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_button.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_header.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AuthSectionHeader(
            title: 'Welcome Back!',
            subtitle: 'Please enter the details.',
          ),
          const SizedBox(height: 20),
          const AppTextField(
            hint: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          const AppTextField(
            hint: 'Password',
            obscure: true,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Checkbox(
                      value: false,
                      onChanged: (_) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const Text(
                'Forgot password?',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Continue with',
            style: TextStyle(color: AppColors.textGrey, fontSize: 12),
          ),
          const SizedBox(height: 20),
          AuthButton(
            label: 'LOG IN',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
