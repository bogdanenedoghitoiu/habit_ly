import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_events.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/ui/welcome/welcome_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;

    final bloc = BlocProvider.of<NavigationBarBloc>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            blurRadius: 30,
            color: Color(0xFF4B1A39).withOpacity(0.2),
          ),
        ],
      ),
      child: SafeArea(
        child: buildBlocBuilder(bloc),
      ),
    );
  }

  Widget buildBlocBuilder(
      NavigationBarBloc bloc) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case NavigationBarLoaded:
            final loadedState = state as NavigationBarLoaded;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                loadedState.props.length,
                (index) => buildIconNavigationItem(
                  isActive: loadedState.props[index].isActive,
                  icon: loadedState.props[index].icon,
                  press: () {
                    bloc.add(
                      SelectNavigationItem(index, loadedState.props),
                    );
                  },
                ),
              ),
            );
          case NavigationBarLoading:
            return buildLoadingWidget();
          default:
            return buildErrorWidget();
        }
      },
    );
  }

  IconButton buildIconNavigationItem({
    required String icon,
    required Function() press,
    bool isActive = false,
  }) {
    return IconButton(
      icon: SvgPicture.asset(
        icon,
        color: isActive ? primaryColor : Color(0xFFD1D4D4),
        height: 22,
      ),
      onPressed: press,
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorWidget() {
    return Container(
      child: Text("Error"),
    );
  }
}
