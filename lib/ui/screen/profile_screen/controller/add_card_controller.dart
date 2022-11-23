import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/profile/add_card_model.dart';
import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';
import 'package:tralever_module/services/over&loding.dart';
import 'package:tralever_module/services/profile_repo/manage_payment_methoda_repo.dart';
import '../../../../models/login/successModel.dart';
import '../view/cars_added_successfully.dart';

class AddCardController extends GetxController {
  final addCardKey = GlobalKey<FormState>();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  List<CardListData> _cardList = [];

  List<CardListData> get cardList => _cardList;

  set cardList(List<CardListData> value) {
    _cardList = value;
    update();
  }

  AddCard? _addCard;

  AddCard? get addCard => _addCard;

  set addCard(AddCard? value) {
    _addCard = value;
    update();
  }

  Card? _card;

  Card? get card => _card;

  set card(Card? value) {
    _card = value;
    update();
  }

  Future cadAddData() async {
    LoadingOverlay.of().show();
    var response = await CardRepo.cardAddData(
      cardHolderName: cardHolderNameController.text.trim(),
      cardNumber: cardNumberController.text.trim(),
      month: monthController.text.trim(),
      year: yearController.text.trim(),
      cvv: cvvController.text.trim(),
    );

    if (response != null && response.id != "") {
      CardRepo.cardAdd(stripeToken: response.id).then((value) {
        LoadingOverlay.of().hide();
        Get.toNamed(CardAddedSuccessfully.routeName);
      });
    }
    return;
  }

  Future cardListShow() async {
    var request = await CardRepo.cardListRepo();
    cardList = request!.data;
    update();
  }

  removeATMCard({required String cardRef}) async {
    SuccessModel? successModel = await CardRepo.removeCard(
      cardRef: cardRef,
    );
    if (successModel != null) {
      return successModel;
    }
  }
}
