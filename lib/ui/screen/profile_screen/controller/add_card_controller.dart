import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';
import 'package:tralever_module/services/profile_repo/manage_payment_methoda_repo.dart';

import '../../../../models/login/successModel.dart';

class AddCardController extends GetxController {
  final addCardKey = GlobalKey<FormState>();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  CardData? _cardData;

  CardData? get cardData => _cardData;

  set cardData(CardData? value) {
    _cardData = value;
    update();
  }

  Future cadAdd() async {
    await CardRepo.cardAdd(
      stripeToken: "dummy token",
      cardHolderName: cardHolderNameController.text.trim(),
      cardNumber: cardNumberController.text.trim(),
      month: monthController.text.trim(),
      year: yearController.text.trim(),
      cvv: cvvController.text.trim(),
    );
  }

  Future<CardData?> CardList() async {
    CardModel? cardModel = await CardRepo.cardListRepo();
    if (cardModel != null) {
      return cardModel.data;
    }
  }

  Future<void> removeATMCard() async {
    SuccessModel? successModel = await CardRepo.removeCard(
      cardRef: "card ref is dummy",
    );
    if (successModel != null) {
      return;
    }
  }
}
