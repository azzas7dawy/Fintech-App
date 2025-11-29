import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:fintech_app/core/theme/app_colors.dart';
import 'package:fintech_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileHeader extends StatelessWidget {
  final String? imageUrl;
  final String userName;

  const ProfileHeader({super.key, this.imageUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 80.0.r,
            backgroundImage: imageUrl != null
                ? CachedNetworkImageProvider(imageUrl!)
                : null,
            child: imageUrl == null
                ? Icon(
                    Icons.person,
                    size: 80.0.r,
                    color: isDark ? Colors.white : AppColors.primaryDark,
                  )
                : null,
          ),
        ),
        SizedBox(height: 23.0.h),
        Align(
          alignment: Alignment.center,
          child: Text(
            userName,
            style: AppTextStyles.styles.latoW700S20.copyWith(
              color: isDark ? Colors.white : AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
