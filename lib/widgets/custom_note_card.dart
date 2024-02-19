import 'package:flutter/material.dart';

const BoxDecoration cardStyle1 = BoxDecoration(color: Colors.green);
const BoxDecoration cardStyle2 = BoxDecoration(color: Colors.grey);

class NoteCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final double height;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NoteCard({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.height,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  final double width;
  final double height;

  Skeleton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
        );
      },
    );
  }
}
