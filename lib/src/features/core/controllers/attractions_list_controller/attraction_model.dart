import 'package:cloud_firestore/cloud_firestore.dart';

class AttractionModel {
  final String id;
  final String title;
  final String location;
  final String picture;
  final String description;
  final String categoryId;
  final double latitude;
  final double longitude;

  AttractionModel({
    required this.id,
    required this.title,
    required this.location,
    required this.picture,
    required this.description,
    required this.categoryId,
    required this.latitude,
    required this.longitude,
  });

  factory AttractionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    return AttractionModel(
      id: data!['id'] as String,
      title: data['title'] as String,
      location: data['location'] as String,
      picture: data['picture'] as String,
      description: data['description'] as String,
      categoryId: data['categoryId'] as String,
      latitude: (data['latitude'] as double?) ??
          0.0, // Provide a default value if null
      longitude: (data['longitiude'] as double?) ??
          0.0, // Provide a default value if null
    );
  }
}
