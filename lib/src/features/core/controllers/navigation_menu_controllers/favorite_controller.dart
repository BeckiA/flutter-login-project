// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../attraction.dart';

// class FavoritesController extends GetxController {
//   static FavoritesController get instance => Get.find();
//   List<Attraction> _favorites = [];

//   List<Attraction> get favorites => _favorites;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchFavorites();
//   }

//   Future<void> fetchFavorites() async {
//     final storage = GetStorage();
//     final favoritesData = storage.read('favorites');
//     if (favoritesData != null) {
//       final favorites = List<Attraction>.from(
//           favoritesData.map((e) => Attraction.fromJson(e)));
//       _favorites.assignAll(favorites);
//     } else {
//       _favorites.assignAll([]);
//     }
//   }

//   void toggleFavoriteStatus(Attraction attraction) {
//     attraction.isFavorite = !attraction.isFavorite;
//     if (attraction.isFavorite) {
//       _favorites.add(attraction);
//     } else {
//       _favorites.remove(attraction);
//     }
//     final storage = GetStorage();
//     storage.write('favorites', _favorites.map((e) => e.toJson()).toList());
//     update();
//   }
// }
