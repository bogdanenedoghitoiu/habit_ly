import 'package:flutter/cupertino.dart';

class CategoryBundle {
  final int id;
  final String title;
  final String description;
  final String imageSrc;
  final Color color;

  CategoryBundle(this.id, this.title, this.description, this.imageSrc,
      this.color);

  static final categoryBundles = [
    CategoryBundle(1, "Paint something everyday.", "just for the fun of it",
        "assets/images/cook_new@2x.png", Color(0xFFD82D40)),
    CategoryBundle(2, "Best healthy food recipes.", "try out some delicious healthy food",
        "assets/images/food_court@2x.png", Color(0xFF2DBBD8)),
    CategoryBundle(3, "Quick and effective workouts.", "get in shape one workout at a time",
        "assets/images/best_2020@2x.png", Color(0xFF90AF17)),
  ];
}
