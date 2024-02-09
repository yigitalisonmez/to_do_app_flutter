import 'package:flutter/material.dart';

const BoxDecoration cardStyle1 = BoxDecoration(color: Colors.green);
const BoxDecoration cardStyle2 = BoxDecoration(color: Colors.grey);

class NoteCard extends StatelessWidget {
  final String title;
  final Color color;
  final double height;

  const NoteCard(
      {super.key,
      required this.title,
      required this.color,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
