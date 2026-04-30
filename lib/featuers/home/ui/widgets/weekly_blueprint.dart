import 'package:fit_flow/core/utils/app_color.dart';
import 'package:fit_flow/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class WeeklyBlueprint extends StatelessWidget {
  const WeeklyBlueprint({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final dates = [12, 13, 14, 15, 16, 17, 18];
    final activeIndices = [2, 3, 4]; // W, T, F (14, 15, 16) based on design

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Weekly Blueprint',
              style: AppTextStyles.bodyLargeDark.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              'Week 1',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.inputBorder),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final isActive = activeIndices.contains(index);
              return Column(
                children: [
                  Text(
                    days[index],
                    style: AppTextStyles.caption.copyWith(
                      color: isActive ? AppColors.primary : AppColors.textGrey,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : AppColors.inputBorder.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${dates[index]}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isActive ? Colors.white : AppColors.textGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
