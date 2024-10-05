import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';
import 'package:todoey_flutter/helpers/widgets/confirmation_dialog.dart';
import 'package:todoey_flutter/helpers/widgets/custom_modal_bottom_sheet.dart';
import 'package:todoey_flutter/models/routine/routine.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/view_models/routines_view_model.dart';

part 'sub_view/routine_card.dart';
part 'sub_view/routine_bottom_sheet.dart';

final formKey = GlobalKey<FormState>();
final TextEditingController controller = TextEditingController();

class RoutinesView extends StatefulWidget {
  static String path = '/routines-view';
  const RoutinesView({super.key});

  @override
  State<RoutinesView> createState() => _RoutinesViewState();
}

class _RoutinesViewState extends State<RoutinesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Routines',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: Provider.of<RoutinesViewModel>(context).routinesBox.length,
          itemBuilder: (context, index) {
            var routines = Provider.of<RoutinesViewModel>(context)
                .routinesBox
                .values
                .toList();
            return RoutineCard(routineId: routines[index].id);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildBottomSheet(context, formKey),
      ),
    );
  }
}
