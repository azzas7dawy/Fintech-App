import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPageIndex;
  final int totalPages;

  const OnboardingState({
    required this.currentPageIndex,
    required this.totalPages,
  });

  bool get isLastPage => currentPageIndex == totalPages - 1;
  bool get isFirstPage => currentPageIndex == 0;

  OnboardingState copyWith({int? currentPageIndex, int? totalPages}) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [currentPageIndex, totalPages];
}
