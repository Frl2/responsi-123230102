import 'package:get/get.dart';
import '../../data/models/character_model.dart';
import '../../data/providers/api_provider.dart';

class CharacterController extends GetxController {
  final _api = ApiProvider();
  final characters = <CharacterModel>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      characters.value = await _api.getCharacters();
    } catch (e) {
      errorMessage.value = 'Failed to load characters. Check your connection.';
    } finally {
      isLoading.value = false;
    }
  }
}
