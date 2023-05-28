import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../controllers/attractions_list_controller/attraction_list_repository.dart';
import '../controllers/attractions_list_controller/attraction_model.dart';
import 'attraction.dart';

class AttractionList extends GetxController {
  static AttractionList get instance => Get.find();

  final AttractionRepository _attractionRepository = AttractionRepository();
  final List<List<Attraction>> _attractionList = [];

  Future<void> fetchAttractions() async {
    try {
      List<List<AttractionModel>> groupedAttractions =
          await _attractionRepository.getAttractionsGroupedByCategory();

      _attractionList.clear();

      // Convert List of List<AttractionModel> to List<List<Attraction>>
      for (List<AttractionModel> attractions in groupedAttractions) {
        List<Attraction> attractionList = attractions.map((attractionModel) {
          return Attraction(
            id: attractionModel.id,
            title: attractionModel.title,
            location: attractionModel.location,
            picture: attractionModel.picture,
            description: attractionModel.description,
            categoryId: attractionModel.categoryId,
            latitude: attractionModel.latitude,
            longitude: attractionModel.longitude,
          );
        }).toList();
        _attractionList.add(attractionList);
      }

      update(); // Notify GetX that the state has changed
    } catch (error) {
      // Handle error
      print('Error fetching attractions: $error');
    }
  }

  List<Attraction> get favoriteItems {
    List<Attraction> favorites = [];
    for (List<Attraction> row in _attractionList) {
      for (Attraction attraction in row) {
        if (attraction.isFavorite) {
          favorites.add(attraction);
        }
      }
    }
    return favorites;
  }

  List<Attraction> getAttractionIndex(int index) {
    if (true) {
      return [..._attractionList[index]];
    }
  }

  List<List<Attraction>> get attractionItems {
    return [
      ..._attractionList.map((attractions) => [...attractions])
    ];
  }

  void printAttractionList() {
    for (List<Attraction> attractions in _attractionList) {
      for (Attraction attraction in attractions) {
        print(attraction.title);
        print(attraction.location);
        // Print other properties as needed
      }
    }
  }

  // Function to find the attraction by id
  Attraction findAttractionById(String id) {
    for (var attractions in _attractionList) {
      for (var attraction in attractions) {
        if (attraction.id == id) {
          return attraction;
        }
      }
    }
    throw Exception('Attraction not found for id: $id');
  }
}
