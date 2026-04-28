import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_validator.dart';
import 'package:fit_flow/featuers/auth/ui/cubit/auth_cubit_cubit.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_button.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_header.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AuthSectionHeader(
              title: 'Welcome Back!',
              subtitle: 'Please enter the details.',
            ),
            const SizedBox(height: 20),
            AppTextField(
              validator: (value) => FormValidators.email(value),
              hint: 'Email Address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            AppTextField(
                validator: (value) => FormValidators.password(value),
              hint: 'Password',
              controller: _passwordController,
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
                      style: TextStyle(color: AppColors.primary, fontSize: 13),
                    ),
                  ],
                ),
                const Text(
                  'Forgot password?',
                  style: TextStyle(color: AppColors.primary, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Continue with',
              style: TextStyle(color: AppColors.textGrey, fontSize: 12),
            ),
            const SizedBox(height: 20),
            BlocBuilder<AuthCubitCubit, AuthCubitState>(
              builder: (context, state) {
                return AuthButton(
                  label: 'LOG IN',
                  isLoading: state is AuthCubitLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubitCubit>().signIn(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
