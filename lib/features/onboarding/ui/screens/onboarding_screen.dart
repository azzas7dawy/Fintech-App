import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../onboarding/cubit/onboarding_cubit.dart';
import '../../../onboarding/cubit/onboarding_state.dart';
import '../widgets/get_started_buttons.dart';
import '../widgets/onboarding_illustration.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page_content.dart';
import '../widgets/onboarding_page_indicator.dart';
import '../widgets/onboarding_skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  late final OnboardingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = OnboardingCubit();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _cubit.updatePageIndex(index);
  }

  void _onNextPressed() {
    final state = _cubit.state;
    if (state.isLastPage) {
      context.go(Routes.homePage);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkipPressed() {
    context.go(Routes.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Column(
                children: [
                  // Skip Button
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: OnboardingSkipButton(onPressed: _onSkipPressed),
                  ),
                  // Page View
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: [
                        _buildPage(context, OnboardingPageType.welcome),
                        _buildPage(context, OnboardingPageType.security),

                        _buildPage(context, OnboardingPageType.market),
                        _buildPage(
                          context,
                          OnboardingPageType.getStarted,
                          showButtons: true,
                        ),
                      ],
                    ),
                  ),
                  // Bottom Navigation
                  if (!state.isLastPage)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnboardingPageIndicator(
                            currentIndex: state.currentPageIndex,
                            totalPages: state.totalPages,
                          ),
                          OnboardingNextButton(
                            onPressed: _onNextPressed,
                            isLastPage: state.isLastPage,
                          ),
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      child: const GetStartedButtons(),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    OnboardingPageType pageType, {
    bool showButtons = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: showButtons
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: OnboardingIllustration(pageType: pageType),
                  ),
                ),
                SizedBox(height: 40.h),
                _buildTitle(context, pageType),
                SizedBox(height: 40.h),
              ],
            )
          : OnboardingPageContent(
              pageType: pageType,
              illustration: OnboardingIllustration(pageType: pageType),
            ),
    );
  }

  Widget _buildTitle(BuildContext context, OnboardingPageType pageType) {
    if (pageType == OnboardingPageType.welcome) {
      return Align(
        alignment: Alignment.centerLeft,
        child: _buildWelcomeTitle(context),
      );
    }

    String titleKey;
    switch (pageType) {
      case OnboardingPageType.market:
        titleKey = TranslationKeys.onboardingMarketTitle;
        break;
      case OnboardingPageType.security:
        titleKey = TranslationKeys.onboardingSecurityTitle;
        break;
      case OnboardingPageType.getStarted:
        titleKey = TranslationKeys.onboardingGetStartedTitle;
        break;
      default:
        titleKey = TranslationKeys.onboardingWelcomeTitle;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titleKey.tr(),
        style: AppTextStyles.styles.latoW700S32.copyWith(
          color: context.primaryText,
          height: 1.2,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildWelcomeTitle(BuildContext context) {
    final isDark = context.isDarkMode;
    final part1 = context.tr('onboarding.welcome.titlePart1');
    final part2 = context.tr('onboarding.welcome.titlePart2');

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: part1,
            style: AppTextStyles.styles.latoW700S32.copyWith(
              fontSize: 30.sp,
              color: isDark ? Colors.white : const Color(0xFF18191F),
              height: 1.92,
            ),
          ),
          TextSpan(
            text: part2,
            style: AppTextStyles.styles.latoW700S32.copyWith(
              fontSize: 30.sp,
              color: AppColors.primaryDark,
              height: 1.92,
            ),
          ),
        ],
      ),
    );
  }
}
