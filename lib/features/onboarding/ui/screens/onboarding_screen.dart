import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../onboarding/cubit/onboarding_cubit.dart';
import '../../../onboarding/cubit/onboarding_state.dart';
import '../widgets/build_page.dart';
import '../widgets/get_started_buttons.dart';
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
                  // Skip Button (hidden on last page)
                  if (!state.isLastPage)
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.h,
                        right: 16.w,
                        left: 16.w,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: OnboardingSkipButton(onPressed: _onSkipPressed),
                      ),
                    ),
                  // Page View
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: const [
                        BuildPage(
                          pageType: OnboardingPageType.welcome,
                          showButtons: false,
                        ),
                        BuildPage(
                          pageType: OnboardingPageType.security,
                          showButtons: false,
                        ),

                        BuildPage(
                          pageType: OnboardingPageType.market,
                          showButtons: false,
                        ),
                        BuildPage(
                          pageType: OnboardingPageType.getStarted,
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
}
