import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/data/providers/habit_categories_provider.dart';

class CategoryBundleCard extends StatelessWidget {
  final CategoryBundle categoryBundle;
  final Function? press;

  const CategoryBundleCard({
    Key? key,
    required this.categoryBundle,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press,
      child: Container(
        decoration: BoxDecoration(
          color: categoryBundle.color,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryBundle.title,
                      style: TextStyle(
                        fontSize: SizeConfig.defaultSize * 2.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize * 0.5,
                    ),
                    Text(
                      categoryBundle.description,
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.defaultSize * 0.5,
            ),
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                categoryBundle.imageSrc,
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
