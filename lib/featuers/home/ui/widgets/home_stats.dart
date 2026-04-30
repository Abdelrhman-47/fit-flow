import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeStats extends StatelessWidget {
  const HomeStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4), // Light green background
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.battery_charging_full, color: Colors.green, size: 20),
                const SizedBox(height: 12),
                Text(
                  'RECOVERY',
                  style: AppTextStyles.label.copyWith(color: Colors.green),
                ),
                const SizedBox(height: 4),
                Text(
                  '94%',
                  style: AppTextStyles.heading2Dark.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  'Optimal status for training today.',
                  style: AppTextStyles.caption.copyWith(color: Colors.green.shade800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED), // Light orange background
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.local_fire_department_outlined, color: Colors.deepOrange, size: 20),
                const SizedBox(height: 12),
                Text(
                  'WEEKLY BURN',
                  style: AppTextStyles.label.copyWith(color: Colors.deepOrange),
                ),
                const SizedBox(height: 4),
                Text(
                  '2,450',
                  style: AppTextStyles.heading2Dark.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  'Active kcal burned this week.',
                  style: AppTextStyles.caption.copyWith(color: Colors.deepOrange.shade800),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
