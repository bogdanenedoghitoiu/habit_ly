import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/categories/categories_bloc.dart';
import 'package:habit_ly/bloc/categories/categories_states.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/ui/home/components/bundle_card.dart';

import 'categories.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HabitCategoriesBloc>(context);

    return SafeArea(
      child: buildBlocBuilder(bloc),
    );
  }

  Widget buildBlocBuilder(HabitCategoriesBloc bloc) {
    return BlocBuilder<HabitCategoriesBloc, HabitCategoryState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HabitCategoriesSuccess:
            final successState = state as HabitCategoriesSuccess;

            return Column(
              children: [
                Categories(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2),
                    child: GridView.builder(
                      itemCount: successState.props.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: SizeConfig.screenOrientation ==
                                Orientation.landscape
                            ? 2
                            : 1,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: SizeConfig.screenOrientation ==
                                Orientation.landscape
                            ? SizeConfig.defaultSize * 2
                            : 0,
                        childAspectRatio: 1.65,
                      ),
                      itemBuilder: (context, index) => CategoryBundleCard(
                        categoryBundle: successState.props[index],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ],
            );
          case HabitCategoriesLoading:
          default:
            return buildLoadingWidget();
        }
      },
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
