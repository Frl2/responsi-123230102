import 'package:get/get.dart';
import 'favorite_spell_controller.dart';

class FavoriteSpellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteSpellController>(
      () => FavoriteSpellController(),
      fenix: true,
    );
  }
}
