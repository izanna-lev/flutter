import 'dart:async';

import 'package:get/get.dart';
import 'package:tralever_module/services/chats_repo/chatRepo.dart';
import 'package:tralever_module/services/home_repo/itinerary_approve_repo.dart';
import 'package:tralever_module/services/home_repo/itinerary_details_repo.dart';
import 'package:tralever_module/services/home_repo/rating_repo.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/home_controller.dart';

import '../../../../models/chats/get_channel_model.dart';
import '../../../../models/home/itinerary_approve_model.dart';
import '../../../../models/home/itinerary_details_model.dart';
import '../../../../models/home/tating_model.dart';
import '../../../../models/login/successModel.dart';

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

  /// GetChannel APi

  GetChannelModelId? _getChannelModelId;

  GetChannelModelId? get getChannelModelId => _getChannelModelId;

  set getChannelModelId(GetChannelModelId? value) {
    _getChannelModelId = value;
    update();
  }

  Future<GetChannelModelId?> getChannel({
    required String itineraryRef,
    // required timezone,
    String? date,
  }) async {
    GetChannelModel? getChannelModel = await ChatRepo.getChannel(
      itineraryRef: itineraryRef,
    );
    if (getChannelModel != null) {
      getChannelModelId = getChannelModel.data;
    }
    return getChannelModelId;
  }

  ///////////////////////////////////////////////////
  ////////////////////  itinerary approve  /////////////////////
  ///////////////////////////////////////////////////

  ItineraryApproveDataModel? _itineraryApproveDataModel;

  ItineraryApproveDataModel? get itineraryApproveDataModel =>
      _itineraryApproveDataModel;

  set itineraryApproveDataModel(ItineraryApproveDataModel? value) {
    _itineraryApproveDataModel = value;
    update();
  }

  HomeController homeController = Get.find<HomeController>();

  itineraryApprove({
    required String itineraryRef,
    required String cardRef,
  }) async {
    ItineraryApproveModel? response =
        await ItineraryApproveRepo.itineraryApproveRepo(
      itineraryRef: itineraryRef,
      cardRef: cardRef,
    );
    if (response != null) {
      itineraryApproveDataModel = response.data;
      if(homeController.pendingPlansData.length > 0) {
        int index = homeController.pendingPlansData.indexWhere((element) => element.id == itineraryRef);
        if(index != -1) {
          homeController.pendingPlansData[index].approved = true;
          homeController.update();
        }
      }
    }
    update();
  }

  /////////////////////////////////////
  /// Cancellation Request API ///
  /////////////////////////////////////
  itineraryCancellationRequest({
    required String itineraryRef,
  }) async {
    SuccessModel? successModel =
        await ItineraryDetailsRepo.itineraryCancellationRequest(
            itineraryRef: itineraryRef);
    if (successModel != null) {
      return successModel;
    }
  }

  ///////////////////////////////////////////////////
  ///  Rating  ///
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
