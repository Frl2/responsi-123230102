import 'package:get/get.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/book_detail/book_detail_binding.dart';
import '../modules/book_detail/book_detail_view.dart';
import '../modules/favorite_spell/favorite_spell_binding.dart';
import '../modules/favorite_spell/favorite_spell_view.dart';
import '../profile/profile.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.bookDetail,
      page: () => const BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.favoriteSpells,
      page: () => const FavoriteSpellView(),
      binding: FavoriteSpellBinding(),
    ),
    GetPage(name: '/profile', page: () => const ProfilePage()),
  ];
}
