import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.errorMessage.value.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.errorMessage.value,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadBooks,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }
      return ListView.builder(
        itemCount: controller.books.length,
        itemBuilder: (context, index) {
          final book = controller.books[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: book.cover.isNotEmpty
                  ? CachedNetworkImageProvider(book.cover)
                  : null,
              child: book.cover.isEmpty ? const Icon(Icons.book) : null,
            ),
            title: Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Release: ${book.releaseDate}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(AppRoutes.bookDetail, arguments: book),
          );
        },
      );
    });
  }
}
