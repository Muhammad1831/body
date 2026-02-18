import 'package:body/features/body-anatomy/data/model/body_part_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BodyController extends GetxController {
  final Rxn<BodyPartModel> selectedPart = Rxn();

  void selectPart(BodyPartModel? bodyPart) {
    if (selectedPart.value != null && bodyPart != null && selectedPart.value!.id == bodyPart.id) {
      selectedPart.value = null;
    } else {
      selectedPart.value = bodyPart;
    }
  }
}
