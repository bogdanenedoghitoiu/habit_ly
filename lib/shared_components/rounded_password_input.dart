import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/text_field_container.dart';

class RoundedPasswordInput extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordInput({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordInputState createState() =>
      _RoundedPasswordInputState(onChanged);
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  final ValueChanged<String> onChanged;
  var _obscuredText = true;

  _RoundedPasswordInputState(this.onChanged);

  void toggleTextVisibility() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscuredText,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: primaryPurpleColor,
          ),
          hintText: "password",
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: primaryPurpleColor,
            ),
            onPressed: () => toggleTextVisibility(),
          ),
        ),
      ),
    );
  }
}
