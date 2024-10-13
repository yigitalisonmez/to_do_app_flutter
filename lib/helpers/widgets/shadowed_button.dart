import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';

class ShadowedButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  const ShadowedButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(3, 3),
                  color: Colors.black,
                ),
              ],
            ),
            child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1.3,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPressed: onPressed,
                icon: Icon(
                  iconData,
                  color: kIconColor,
                  size: 35,
                )),
          ),
        ],
      ),
    );
  }
}
