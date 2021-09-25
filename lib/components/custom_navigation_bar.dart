import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_events.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/configuration/size_configuration.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class NavigationBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

class _NavigationBarState extends State<CustomNavigationBar> {
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

  BlocBuilder<NavigationBarBloc, NavigationBarState> buildBlocBuilder(NavigationBarBloc bloc) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, state) {
          if (state is NavigationBarLoading) {
            return buildLoadingWidget();
          } else if (state is NavigationBarLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                state.props.length,
                (index) => buildIconNavigationItem(
                  isActive: state.props[index].isActive,
                  icon: state.props[index].icon,
                  press: () {
                    bloc.add(
                      SelectNavigationItem(index),
                    );
                  },
                ),
              ),
            );
          } else
            return buildErrorWidget();
        },
      );
  }

  IconButton buildIconNavigationItem(
      {required String icon,
      required Function() press,
      bool isActive = false}) {
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
