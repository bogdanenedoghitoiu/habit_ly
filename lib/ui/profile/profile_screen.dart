import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/configuration/global_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicture(),
            SizedBox(height: 20),
            ProfileMenuEntry(
              text: "My Account",
              icon: Icons.person,
              onPress: () {},
            ),
            ProfileMenuEntry(
              text: "Settings",
              icon: Icons.settings,
              onPress: () {},
            ),
            ProfileMenuEntry(
              text: "Log Out",
              icon: Icons.logout,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuEntry extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPress;

  const ProfileMenuEntry({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryPurpleColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryPurpleColor,
            ),
          ],
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => lightPurpleColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/icons/chef.svg"),
          ),
          Positioned(
            bottom: 0,
            right: -10,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/chef.svg"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
