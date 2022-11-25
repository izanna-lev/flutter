import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/profile/add_card_model.dart';
import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';
import 'package:tralever_module/services/over&loding.dart';
import 'package:tralever_module/services/profile_repo/manage_payment_methoda_repo.dart';
import '../../../../models/login/successModel.dart';
import '../../../../models/profile/add_card_detaile_model.dart';
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

  String? cardRef;

  AddCardDetail? _addCardDetail;

  AddCardDetail? get addCardDetail => _addCardDetail;

  set addCardDetail(AddCardDetail? value) {
    _addCardDetail = value;
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
        cardHolderNameController.clear();
        cardNumberController.clear();
        monthController.clear();
        yearController.clear();
        cvvController.clear();
        Get.toNamed(CardAddedSuccessfully.routeName);
      });
    }
    return;
  }

  CardModel? _cardModel;

  CardModel? get cardModel => _cardModel;

  set cardModel(CardModel? value) {
    _cardModel = value;
    update();
  }

  Future cardListShow() async {
    var request = await CardRepo.cardListRepo();
    cardList = request!.data;
    if (cardList.isNotEmpty) {
      for (int i = 0; i < cardList.length; i++) {
        if (cardList[i].defaultCard) {
          cardList[i].selectedCard = true;
          break;
        }
      }
      int index = cardList.indexWhere((element) => element.defaultCard == true);
      if (index == -1) {
        cardList[0].selectedCard = true;
      }
    }
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
