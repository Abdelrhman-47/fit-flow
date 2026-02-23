import 'package:fit_flow/featuers/auth/ui/widgets/socila_login.dart';
import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
