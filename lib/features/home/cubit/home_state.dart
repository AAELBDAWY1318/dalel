import 'package:dalel/features/home/data/models/historical_period_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class ChangeBottomNavigationBarState extends HomeState {}

class WillPopState extends HomeState {}

class GetHistoricalPeriodsLoading extends HomeState {}

class GetHistoricalPeriodsSuccess extends HomeState {
  final List<HistoricalPeriod> historicalPeriod;

  GetHistoricalPeriodsSuccess({required this.historicalPeriod});
}

class GetHistoricalPeriodsFailure extends HomeState {
  final String errorMessage;

  GetHistoricalPeriodsFailure({required this.errorMessage});
}
