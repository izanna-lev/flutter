import 'dart:async';

import 'package:get/get.dart';
import 'package:tralever_module/services/home_repo/itinerary_details_repo.dart';
import 'package:tralever_module/services/home_repo/rating_repo.dart';

import '../../../../models/home/itinerary_details_model.dart';
import '../../../../models/home/tating_model.dart';

class ItineraryDetailScreenController extends GetxController {
  double? _overallRating;
  double? get overallRating => _overallRating;
  set overallRating(double? value) {
    _overallRating = value;
    update();
  }

  double? _specialistRating;
  double? get specialistRating => _specialistRating;
  set specialistRating(double? value) {
    _specialistRating = value;
    update();
  }

  double? _valueRating;
  double? get valueRating => _valueRating;
  set valueRating(double? value) {
    _valueRating = value;
    update();
  }

  int _selectValue = 0;
  int get selectValue => _selectValue;
  set selectValue(int value) {
    _selectValue = value;
    update();
  }

  ItineraryDetailsModel? _itineraryDetailsModel;

  ItineraryDetailsModel? get itineraryDetailsModel => _itineraryDetailsModel;

  set itineraryDetailsModel(ItineraryDetailsModel? value) {
    _itineraryDetailsModel = value;
    update();
  }

  ItineraryDetailsListModel? _itineraryDetailsListModel;
  ItineraryDetailsListModel? get itineraryDetailsListModel =>
      _itineraryDetailsListModel;
  set itineraryDetailsListModel(ItineraryDetailsListModel? value) {
    _itineraryDetailsListModel = value;
    update();
  }

  Itinerary? _itinerary;
  Itinerary? get itinerary => _itinerary;
  set itinerary(Itinerary? value) {
    _itinerary = value;
    update();
  }

  Future<ItineraryDetailsListModel?> itineraryDetails({
    required String itineraryRef,
    // required timezone,
    String? date,
  }) async {
    ItineraryDetailsModel? itineraryDetailsModel =
        await ItineraryDetailsRepo.itineraryDetailsRepo(
            itineraryRef: itineraryRef, date: date);
    if (itineraryDetailsModel != null) {
      itineraryDetailsListModel = itineraryDetailsModel.data;
    }
    return itineraryDetailsListModel;
  }

  ///////////////////////////////////////////////////
  ////////////////////  Rating  /////////////////////
  ///////////////////////////////////////////////////
  RatingData? _ratingData;
  RatingData? get ratingData => _ratingData;
  set ratingData(RatingData? value) {
    _ratingData = value;
    update();
  }

  Future<RatingData?> ratingDetails({
    required String itineraryRef,
    required double experience,
    required double specialist,
    required double value,
  }) async {
    RatingModel? ratingModel = await RatingDetailsRepo.ratingDetailsRepo(
      itineraryRef: itineraryRef,
      experience: experience,
      specialist: specialist,
      value: value,
    );
    if (ratingModel != null) {
      ratingData = ratingModel.data;
    }
    return ratingData;
  }

  @override
  void onInit() {
    var data = Get.arguments;
    print('LOCATION==>${data[0]}');
    print('NAME==>${data[1]}');
    super.onInit();
  }
}
