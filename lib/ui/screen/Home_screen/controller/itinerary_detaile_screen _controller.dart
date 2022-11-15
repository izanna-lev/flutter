import 'dart:async';

import 'package:get/get.dart';
import 'package:tralever_module/services/home_repo/itinerary_details_repo.dart';
import 'package:tralever_module/services/home_repo/rating_repo.dart';

import '../../../../models/home/itinerary_details_model.dart';
import '../../../../models/home/tating_model.dart';

class ItineraryDetailScreenController extends GetxController {
  int _selectValue = 0;

  int get selectValue => _selectValue;

  set selectValue(int value) {
    _selectValue = value;
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
    required int timezone,
  }) async {
    ItineraryDetailsModel? itineraryDetailsModel =
        await ItineraryDetailsRepo.itineraryDetailsRepo(
      itineraryRef: itineraryRef,
      timezone: timezone,
    );
    if (itineraryDetailsModel != null) {
      return itineraryDetailsModel.data;
    }
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
    required int experience,
    required int specialist,
    required int value,
  }) async {
    RatingModel? ratingModel = await RatingDetailsRepo.ratingDetailsRepo(
      itineraryRef: itineraryRef,
      experience: experience,
      specialist: specialist,
      value: value,
    );
    if (ratingModel != null) {
      return ratingModel.data;
    }
  }
}
