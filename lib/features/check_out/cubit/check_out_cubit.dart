import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/locator_service.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  List<Object?> address = (getIt<CacheHelper>().getData(key: "address")) ??
      ["Cairo", "Pangandaran Brick Street No. 690445434 Yogya, Central Java"];

  String? fawaterkurl;
  bool paymentCompleted = false;

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

  Future<void> determinePosition() async {
    try {
      emit(GetAddressLoading());
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(
            GetAddressFailure(errorMessage: 'Location services are disabled.'));
      } else {
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(GetAddressFailure(
                errorMessage: 'Location permissions are denied'));
          }
        } else if (permission == LocationPermission.deniedForever) {
          emit(GetAddressFailure(
              errorMessage:
                  'Location permissions are permanently denied, we cannot request permissions.'));
        } else {
          Position position = await Geolocator.getCurrentPosition();
          double latitude = position.latitude;
          double longitude = position.longitude;
          List<Placemark> placemarks =
              await placemarkFromCoordinates(latitude, longitude);
          if (placemarks.isNotEmpty) {
            Placemark place = placemarks[0];
            emit(GetAddressSuccess(
                city: place.locality!,
                addressdetails:
                    "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}"));
            await getIt<CacheHelper>().saveData(key: "address", value: [
              place.locality!,
              "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}"
            ]);
          } else {
            emit(GetAddressFailure(
                errorMessage: "No address available for this location."));
          }
        }
      }
    } catch (e) {
      emit(GetAddressFailure(
          errorMessage: "Failed to get address: ${e.toString()}"));
    }
  }

  getUserData() async {
    try {
      emit(GetUserDataLoading());
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection("user").doc(uid).get();
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      emit(GetUserDataSuccess(
          firstName: data["firstName"],
          lastName: data["secondName"],
          email: data["email"]));
    } catch (e) {
      emit(GetUserDataFailure(errorMessage: e.toString()));
    }
  }

  completePayment(String firstName, String lastName, String email,
      double totalPayment, String address) async {
    try {
      emit(ConfirmPaymentLoading());
      final data = {
        'payment_method_id': 2,
        'cartTotal': '100',
        'currency': 'EGP',
        'customer': {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone': '01000000000',
          'address': address,
        },
        'redirectionUrls': {
          'successUrl': 'https://dev.fawaterk.com/success',
          'failUrl': 'https://dev.fawaterk.com/fail',
          'pendingUrl': 'https://dev.fawaterk.com/pending',
        },
        'cartItems': [
          {
            'name': 'test',
            'price': '100',
            'quantity': '1',
          },
        ],
      };

      final headers = {
        'Authorization': 'Bearer ${APIStrings.apiToken}',
        'Content-Type': 'application/json',
      };
      final response = await http.post(
        Uri.parse(APIStrings.apiUrl),
        headers: headers,
        body: json.encode(data),
      );
      final responseData = json.decode(response.body);
      if (responseData != null) {
        log("Response body: ${response.body}");
        fawaterkurl = responseData['data']['payment_data']['redirectTo'];
        paymentCompleted = true;
        emit(ConfirmPaymentSuccess());
      }
    } catch (e) {
      log("${e.toString()} , ${e.hashCode}");
      emit(ConfirmPaymentFailure(errorMessage: e.toString()));
    }
  }
}
