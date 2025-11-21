// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:testing_in_flutter/core/theme/app_colors.dart';
// import 'package:testing_in_flutter/features/home/data/model/movie_model.dart';

// class MovieImage extends StatelessWidget {
//   const MovieImage({super.key, required this.movieModel});
//   final MovieModel? movieModel;
//   @override
//   Widget build(BuildContext context) {
//     String imgUrl = 'https://image.tmdb.org/t/p/w500/${movieModel?.posterPath}';

//     return Container(
//       width: 110.w,
//       height: 110.h,
//       // padding: EdgeInsets.all(10.w),
//       decoration: BoxDecoration(
//         color: AppColors.mainColor,
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadiusGeometry.circular(12.r),
//         child: Image.network(
//           imgUrl,

//           width: double.infinity,
//           fit: BoxFit.cover,
//           errorBuilder: (context, error, stackTrace) {
//             log('img error ${error.toString()}');
//             return const Center(
//               child: Icon(Icons.image_not_supported, size: 40),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
