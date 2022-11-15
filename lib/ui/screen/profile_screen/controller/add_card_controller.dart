import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';
import 'package:tralever_module/services/profile_repo/manage_payment_methoda_repo.dart';

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
      stripeToken:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjMyYWI1ZTUzZTQ5ODNmOTMzNGNiNzc1IiwiZW1haWwiOiJ1dDE0NjQxNEBnbWFpbC5jb20iLCJ0b2tlbkxpZmUiOiI3ZCIsInJvbGUiOiJ1c2VyIn0sImlhdCI6MTY2NzYyNjg4MSwiZXhwIjoxNjY4MjMxNjgxfQ.VEyluPKFFGHxV-FloWYa7uH38jo6l09wCOARM7VzKs8",
      cardHolderName: cardHolderNameController.text.trim(),
      cardNumber: cardNumberController.text.trim(),
      month: monthController.text.trim(),
      year: yearController.text.trim(),
      cvv: cvvController.text.trim(),
    );
  }
}
