import 'package:cloud_firestore/cloud_firestore.dart';

import 'attraction_model.dart';

class AttractionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<List<AttractionModel>>> getAttractionsGroupedByCategory() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('Attractions').get();

      // Define the categoryIds to filter
      List<String> categoryIds = [
        'hs',
        'rs',
        // 'np',
        // 'wb',
        // 'hv',
        // 'mus',
        // 'fest',
        // 'eve'
      ];

      // Create a map to hold the grouped attractions
      Map<String, List<AttractionModel>> groupedAttractions = {};

      // Filter attractions based on categoryIds
      for (String categoryId in categoryIds) {
        List<AttractionModel> attractions = querySnapshot.docs
            .map((doc) => AttractionModel.fromSnapshot(
                doc as DocumentSnapshot<Map<String, dynamic>>))
            .where((attraction) => attraction.categoryId == categoryId)
            .toList();

        groupedAttractions[categoryId] = attractions;
      }

      // Convert the grouped attractions map to List<List<AttractionModel>>
      List<List<AttractionModel>> groupedAttractionsList =
          groupedAttractions.values.toList();

      return groupedAttractionsList;
    } catch (error) {
      // Handle error
      print('Error fetching attractions from firestore: $error');
      throw error;
    }
  }
}
