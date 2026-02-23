import 'package:flutter/material.dart';

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
