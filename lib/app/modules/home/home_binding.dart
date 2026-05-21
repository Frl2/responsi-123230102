import 'package:get/get.dart';
import 'home_controller.dart';
import '../character/character_controller.dart';
import '../spell/spell_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CharacterController>(() => CharacterController());
    Get.lazyPut<SpellController>(() => SpellController());
  }
}
