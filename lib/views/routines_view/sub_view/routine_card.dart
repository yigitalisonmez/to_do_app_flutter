part of '../routines_view.dart';

class RoutineCard extends StatefulWidget {
  final String routineId;
  const RoutineCard({super.key, required this.routineId});

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  final ValueNotifier<bool> isOpenNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    Routine? routine = Provider.of<RoutinesViewModel>(context)
        .getRoutineById(widget.routineId);
    return ValueListenableBuilder<bool>(
      valueListenable: isOpenNotifier,
      builder: (context, isOpen, child) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: palette[1],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () => isOpenNotifier.value = !isOpenNotifier.value,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                          child: Text(
                        routine!.routineName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),

                      const Spacer(),
                      Text(
                        Provider.of<RoutinesViewModel>(context)
                            .calculateProgress(routineId: routine.id),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      /// SETTINGS
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                              title: const Text('Add habit'),
                              onTap: () {
                                Navigator.pop(context);
                                _addHabitFunction(
                                    context: context, routine: routine);
                              },
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: const Text('Re-order habits'),
                              onTap: () {
                                // Handle share action
                                Navigator.pop(context); // Close menu
                              },
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              title: const Text('Delete Routine'),
                              onTap: () {
                                // Handle share action
                                Navigator.pop(context);
                                _deleteRoutineFunction(
                                    context: context,
                                    routineId: widget.routineId);
                              },
                            ),
                          ),
                        ],
                        icon: const Icon(Icons.more_vert_sharp),
                      ),
                    ],
                  ),
                ),
              ),

              /// TILES
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: isOpen ? routine.routineList.length : 0,
                  itemBuilder: (context, index) {
                    return RoutineTile(
                      routineId: routine.id,
                      index: index,
                      toggleIsDoneFunction: () =>
                          Provider.of<RoutinesViewModel>(context, listen: false)
                              .toggleCheckbox(routine.id, index),
                      deleteRoutineItemFunction: () => _deleteRoutineFunction(
                          context: context, routineId: routine.id),
                    );
                  })
            ],
          ),
        );
      },
    );
  }
}

class RoutineTile extends StatelessWidget {
  final String routineId;
  final int index;
  final Function() toggleIsDoneFunction;
  final Function() deleteRoutineItemFunction;

  const RoutineTile(
      {super.key,
      required this.routineId,
      required this.index,
      required this.toggleIsDoneFunction,
      required this.deleteRoutineItemFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(
            Provider.of<RoutinesViewModel>(context)
                .getRoutineById(routineId)!
                .routineList[index]
                .title,
          ),
          tileColor: palette[0],
          leading: Checkbox(
            fillColor: MaterialStateProperty.all(palette[2]),
            value: Provider.of<RoutinesViewModel>(context)
                .getRoutineById(routineId)!
                .routineList[index]
                .isDone,
            onChanged: (bool? value) => toggleIsDoneFunction(),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
            ),
            onPressed: () => _deleteHabitFunction(
              context: context,
              routineId: routineId,
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

_addHabitFunction({required BuildContext context, required Routine routine}) {
  // Show habit adding UI
  showModalBottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return CustomModalBottomSheet(
        formKey: formKey,
        children: [
          const Text(
            'Add a habit!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Divider(
            thickness: 0.7,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                return 'Enter a valid habit name';
              }
            },
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Habit Name',
              hintText: 'What is the name of your new habit',
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                color: Color(0xffbbbbbb),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context);
                // Add habits to routine
                Provider.of<RoutinesViewModel>(context, listen: false)
                    .addItemToRoutine(
                        routineItemTitle: controller.text,
                        currRoutine: routine);
                controller.text = '';
              }
            },
            child: const Text('Add!'),
          ),
        ],
      );
    },
  );
}

_deleteRoutineFunction(
    {required BuildContext context, required String routineId}) {
  return showDialog(
    context: context,
    builder: (builder) => ConfirmationDialog(
        title: 'Do you want to delete this Routine?',
        callbackFunction: () =>
            Provider.of<RoutinesViewModel>(context, listen: false)
                .deleteRoutineById(routineId)),
  );
}

_deleteHabitFunction(
    {required BuildContext context,
    required String routineId,
    required int index}) {
  return showDialog(
    context: context,
    builder: (builder) => ConfirmationDialog(
        title: 'Do you want to delete this Routine?',
        callbackFunction: () =>
            Provider.of<RoutinesViewModel>(context, listen: false)
                .deleteItemFromRoutine(routineId: routineId, index: index)),
  );
}
