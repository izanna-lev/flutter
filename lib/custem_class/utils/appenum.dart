enum ItineraryDetailStatus { ACCOMMODATION, RESTAURANT, ACTIVITY, FLIGHT, TRAIN, FERRY, CAR, NOTE, CHECK_OUT }

extension ItineraryDetailStatusExtension on ItineraryDetailStatus {

  int get type {
    switch (this) {
      case ItineraryDetailStatus.ACCOMMODATION:
        return 1;
      case ItineraryDetailStatus.RESTAURANT:
        return 2;
      case ItineraryDetailStatus.ACTIVITY:
        return 3;
      case ItineraryDetailStatus.FLIGHT:
        return 4;
      case ItineraryDetailStatus.TRAIN:
        return 5;
      case ItineraryDetailStatus.FERRY:
        return 6;
      case ItineraryDetailStatus.CAR:
        return 7;
      case ItineraryDetailStatus.NOTE:
        return 8;
      case ItineraryDetailStatus.CHECK_OUT:
        return 9;
    }
  }
}