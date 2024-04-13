part of '../routines_view.dart';

_buildRoutineCard({required String routineId, required BuildContext context}) {
  final ValueNotifier<bool> isOpenNotifier = ValueNotifier(false);
  Routine? routine =
      Provider.of<RoutinesViewModel>(context).getRoutineById(routineId);
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

                    /// SETTINGS
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            title: const Text('Add habit'),
                            onTap: () => _addHabitFunction(
                                context: context, routine: routine),
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
                  return _buildRoutineTile(
                      routineId: routine.id, index: index, context: context);
                })
          ],
        ),
      );
    },
  );
}

_buildRoutineTile(
    {required String routineId,
    required int index,
    required BuildContext context}) {
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
          value: false,
          onChanged: (bool? value) {},
        ),
      ),
    ),
  );
}

_addHabitFunction({required BuildContext context, required Routine routine}) {
  // Pop settings menu
  Navigator.pop(context);
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
    {required BuildContext context, required String routineId}) {}
