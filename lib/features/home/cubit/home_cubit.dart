import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/data/models/historical_char.dart';
import 'package:dalel/features/home/data/models/historical_period_model.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHistoricalPeriods() {
    emit(GetHistoricalPeriodsLoading());
    FirebaseFirestore.instance
        .collection(FirebaseKeys.historicalPeriod)
        .get()
        .then((querySnapshot) {
      List<HistoricalPeriod> documents = [];

      for (var document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data(); // Get data as a Map
        data['id'] = document.id; // Optionally include the document ID
        documents.add(HistoricalPeriod.fromJson(data));
      }
      emit(GetHistoricalPeriodsSuccess(historicalPeriod: documents));
    }).catchError((error) {
      emit(GetHistoricalPeriodsFailure(errorMessage: error.toString()));
    });
  }

  getHistoricalCharacters() {
    emit(GetHistoricalCharactersLoading());
    FirebaseFirestore.instance
        .collection(FirebaseKeys.historicalCharacters)
        .get()
        .then((querySnapshot) {
      List<HistoricalCharacters> documents = [];

      for (var document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data(); // Get data as a Map
        data['id'] = document.id; // Optionally include the document ID
        documents.add(HistoricalCharacters.fromJson(data));
      }
      emit(GetHistoricalCharactersSuccess(historicalCharacters: documents));
    }).catchError((error) {
      emit(GetHistoricalCharactersFailure(errorMessage: error.toString()));
    });
  }

  getSouvenirs(){
    emit(GetSouvenirsLoading());
    FirebaseFirestore.instance
        .collection(FirebaseKeys.souvenirs)
        .get()
        .then((querySnapshot) {
      List<SouvenirModel> documents = [];

      for (var document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data(); // Get data as a Map
        data['id'] = document.id; // Optionally include the document ID
        documents.add(SouvenirModel.fromJson(data));
      }
      emit(GetSouvenirsSuccess(souvenirs: documents));
    }).catchError((error) {
      emit(GetSouvenirsFailure(errorMessage: error.toString()));
    });
  }
}
