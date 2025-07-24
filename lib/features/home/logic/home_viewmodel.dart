// features/home/logic/home_viewmodel.dart
import 'package:cyanaseapp/core/models/fund_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/home_service.dart';

class HomeState {
  final bool isLoading;
  final List<PortfolioItem> portfolio;
  final List<FundManager> fundManagers;
  final String? error;

  HomeState({
    this.isLoading = false,
    this.portfolio = const [],
    this.fundManagers = const [],
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    List<PortfolioItem>? portfolio,
    List<FundManager>? fundManagers,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      portfolio: portfolio ?? this.portfolio,
      fundManagers: fundManagers ?? this.fundManagers,
      error: error,
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final HomeService _service;

  HomeViewModel(this._service) : super(HomeState()) {
    loadData();
  }

  Future<void> loadData() async {
    try {
      state = state.copyWith(isLoading: true);
      final portfolio = await _service.fetchPortfolio();
      final fundManagers = await _service.fetchFundManagers();
      state = state.copyWith(
        isLoading: false,
        portfolio: portfolio,
        fundManagers: fundManagers,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// Riverpod provider
final homeServiceProvider = Provider<HomeService>((ref) => HomeService());

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(ref.read(homeServiceProvider)),
);
