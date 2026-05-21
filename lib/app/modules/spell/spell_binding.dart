import 'package:get/get.dart';
import 'spell_controller.dart';

class SpellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpellController>(() => SpellController());
  }
}
