import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:meta/meta.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  getProducts(List<String> ids) {
    try {
      emit(GetListOfProductLoading());
      FirebaseFirestore.instance
          .collection(FirebaseKeys.souvenirs)
          .get()
          .then((value) {
        List<SouvenirModel> documents = [];
        for (var doc in value.docs) {
          if (ids.contains(doc.id)) {
            Map<String, dynamic> data = doc.data(); // Get data as a Map
            data['id'] = doc.id;
            documents.add(SouvenirModel.fromJson(data));
          }
        }
        emit(GetListProductSuccess(products: documents));
      });
    } catch (e) {
      emit(GetListOfProductFailure(errorMessage: e.toString()));
    }
  }
}
