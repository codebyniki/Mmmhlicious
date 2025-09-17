import 'package:frontend/model/ingredient.dart';

class Recipe {
  int id;
  String title;
  String imageUrl;
  List<String> typeAndTags;
  String details;
  Map<Ingredient, String> ingredientsList;
  List<String> steps;
  int cookingTime;
  int likes;
  int comments;

  Recipe.create({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.typeAndTags,
    required this.details,
    required this.ingredientsList,
    required this.steps,
    required this.cookingTime,
    required this.likes,
    required this.comments
  });
}