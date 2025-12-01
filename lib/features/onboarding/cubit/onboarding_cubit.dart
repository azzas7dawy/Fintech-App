import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
    : super(const OnboardingState(currentPageIndex: 0, totalPages: 4));

  void updatePageIndex(int index) {
    if (index >= 0 && index < state.totalPages) {
      emit(state.copyWith(currentPageIndex: index));
    }
  }

  void nextPage() {
    if (!state.isLastPage) {
      emit(state.copyWith(currentPageIndex: state.currentPageIndex + 1));
    }
  }

  void previousPage() {
    if (!state.isFirstPage) {
      emit(state.copyWith(currentPageIndex: state.currentPageIndex - 1));
    }
  }

  void goToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < state.totalPages) {
      emit(state.copyWith(currentPageIndex: pageIndex));
    }
  }
}
