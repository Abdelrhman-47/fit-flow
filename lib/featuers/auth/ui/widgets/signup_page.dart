import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_validator.dart';
import 'package:fit_flow/featuers/auth/ui/cubit/auth_cubit_cubit.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_button.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/auth_header.dart';
import 'package:fit_flow/featuers/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _agreed = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fullNameController.dispose();
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
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  hint: 'Full Name',
                  controller: _fullNameController,
                  validator: (value) => FormValidators.name(value),
                ),
                const SizedBox(height: 12),
                AppTextField(
                  hint: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                  FormValidators.email(value)
                  
                ),
                const SizedBox(height: 12),
                AppTextField(
                  hint: 'Password',
                  controller: _passwordController,
                  obscure: true,
                  validator: (value) => FormValidators.password(value),
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
                BlocBuilder<AuthCubitCubit, AuthCubitState>(
                  builder: (context, state) {
                    return AuthButton(
                      label: 'CREATE ACCOUNT',
                      isLoading: state is AuthCubitLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (!_agreed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please agree to terms and conditions'),
                              ),
                            );
                            return;
                          }
                          context.read<AuthCubitCubit>().signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
