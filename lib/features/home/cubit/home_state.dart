import 'package:dalel/features/home/data/models/historical_char.dart';
import 'package:dalel/features/home/data/models/historical_period_model.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';

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

class GetHistoricalCharactersLoading extends HomeState {}

class GetHistoricalCharactersSuccess extends HomeState {
  final List<HistoricalCharacters> historicalCharacters;

  GetHistoricalCharactersSuccess({required this.historicalCharacters});
}

class GetHistoricalCharactersFailure extends HomeState {
  final String errorMessage;

  GetHistoricalCharactersFailure({required this.errorMessage});
}

class GetSouvenirsLoading extends HomeState {}

class GetSouvenirsSuccess extends HomeState {
  final List<SouvenirModel> souvenirs;

  GetSouvenirsSuccess({required this.souvenirs});
}

class GetSouvenirsFailure extends HomeState {
  final String errorMessage;

  GetSouvenirsFailure({required this.errorMessage});
}
