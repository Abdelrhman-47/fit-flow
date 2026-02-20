import 'package:fit_flow/core/utils/app_color.dart';
import 'package:flutter/material.dart';



// ─────────────────────────────────────────
// auth_tab_switcher
// ─────────────────────────────────────────

// ─────────────────────────────────────────
// Custom Text Field
// ─────────────────────────────────────────


// ─────────────────────────────────────────
// Primary Button
// ─────────────────────────────────────────


// ─────────────────────────────────────────
// Social Login Button
// ─────────────────────────────────────────
class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white12),
        ),
        child: Icon(icon, color: Colors.white70, size: 22),
      ),
    );
  }
}

// ─────────────────────────────────────────
// Section Header (Welcome / Sign Up)
// ─────────────────────────────────────────
class AuthSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color:AppColors.primaryLight,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: AppColors.primaryLight, fontSize: 13),
        ),
      ],
    );
  }
}
