import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:fintech_app/features/payment/presentation/widgets/build_card_chip.dart';
import 'package:fintech_app/features/payment/presentation/widgets/colored_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardSection extends StatelessWidget {
  final Color cardBackground;

  const CreditCardSection({
    super.key,
    required this.cardBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [
              Text(
                'Credit Card',
                style: AppTextStyles.styles.latoW500S14.copyWith(
                  color: AppColors.mainColor,
                ),

              
              ),
              Spacer(),
           const   Icon(
                Icons.keyboard_arrow_up,
                color: AppColors.mainColor,
              ),
            ],
          ),
           SizedBox(height: 16.h),
          Row(
            children: [
              buildCardTypeChip(
                'VISA',
                selected: true,
                logoImage: Image.asset('assets/images/Maskgroup.png'),
              ),
             SizedBox(width: 12.w),
              buildCardTypeChip(
                '',
                logoImage: Image.asset('assets/images/MastercardLogo.png'),
              ),
             SizedBox(width: 12.w),
              buildCardTypeChip(
                '',
                logoImage: Image.asset('assets/images/apple.png'),
              ),
            ],
          ),
           SizedBox(height: 20.h),
          const CustomColoredCard(),
        ],
      ),
    );
  }
}
