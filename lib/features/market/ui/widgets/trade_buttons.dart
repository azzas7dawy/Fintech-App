import 'package:easy_localization/easy_localization.dart';
import 'package:fintech_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/translation_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/button_app.dart';

class TradeButtons extends StatelessWidget {
  const TradeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ButtonApp(
            title: TranslationKeys.sell.tr(),
            onPressed: () {
              context.push(Routes.buyCryptoScreen);
            },
            backgroundColor: context.errorBackground,
            textColor: context.errorText,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ButtonApp(
            title: TranslationKeys.buy.tr(),
            onPressed: () {
              context.push(Routes.buyCryptoScreen);
            },
          ),
        ),
      ],
    );
  }
}
