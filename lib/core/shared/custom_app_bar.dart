// import 'package:fintech_app/core/shared/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';

// class CustomAppBar extends StatelessWidget {
//   final String title;
//   const CustomAppBar({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 15.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(onTap: () => context.pop(), child: SvgPicture.asset(AssetHelper.backForwardIcon)),
//           const SizedBox(height: 20),
//           Align(
//             alignment: Alignment.center,
//             child: Text(
//               title,
//               textAlign: TextAlign.center,

//               style: AppTextStyles.headingMedium.copyWith(fontWeight: FontWeight.w700, height: 28.h / 18.sp),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
