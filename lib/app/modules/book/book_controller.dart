import 'package:get/get.dart';
import '../../data/models/book_model.dart';
import '../../data/providers/api_provider.dart';

class BookController extends GetxController {
  final _api = ApiProvider();
  final books = <BookModel>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }

  Future<void> loadBooks() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      books.value = await _api.getBooks();
    } catch (e) {
      errorMessage.value = 'Failed to load books. Check your connection.';
    } finally {
      isLoading.value = false;
    }
  }
}
