
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/data/models/historical_period_model.dart';
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
}
