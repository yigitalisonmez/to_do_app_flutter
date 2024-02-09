import 'package:flutter/material.dart';

const BoxDecoration cardStyle1 = BoxDecoration(color: Colors.green);
const BoxDecoration cardStyle2 = BoxDecoration(color: Colors.grey);

class NoteCard extends StatelessWidget {
  final String title;
  final Color color;
  final double height;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NoteCard({
    super.key,
    required this.title,
    required this.color,
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
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
