import 'package:flutter/material.dart';
import 'package:todoey_flutter/helpers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomModalBottomSheet extends StatefulWidget {
  final List<Widget>? children;
  final GlobalKey<FormState>? formKey;
  const CustomModalBottomSheet({super.key, this.children, this.formKey});

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        color: Provider.of<ThemeProvider>(context).isDark
            ? const Color(0xff141415)
            : const Color(0xff676c70),
        child: Container(
          decoration: BoxDecoration(
            color: Provider.of<ThemeProvider>(context).isDark
                ? Colors.black
                : Colors.white,
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children ?? [const SizedBox()],
            ),
          ),
        ),
      ),
    );
  }
}
