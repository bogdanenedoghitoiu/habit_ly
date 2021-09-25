import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/data/providers/dummy_provider.dart';
import 'package:habit_ly/ui/home/components/bundle_card.dart';

import 'categories.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: CategoryBundle.categoryBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.screenOrientation == Orientation.landscape
                          ? 2
                          : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                      SizeConfig.screenOrientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => CategoryBundleCard(
                  categoryBundle: CategoryBundle.categoryBundles[index],
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
