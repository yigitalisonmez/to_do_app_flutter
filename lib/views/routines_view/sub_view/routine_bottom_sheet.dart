part of '../routines_view.dart';

_buildBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return CustomModalBottomSheet(
        key: formKey,
        children: [
          const Text(
            'Create a Routine!',
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
                return 'Enter a valid routine name';
              }
            },
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Routine Name',
              hintText: 'What is the name of your new Routine',
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                color: Color(0xffbbbbbb),
              ),
            ),
          ),
          const Spacer(),
          const Center(
              child: Text(
            'Choose a routine time',
            style: TextStyle(fontSize: 16),
          )),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            spacing: 10,
            children: Provider.of<RoutinesViewModel>(context)
                .chips
                .mapIndexed(
                  (choiceChip, index) => ChoiceChip(
                    label: Text(choiceChip.label.getText()),
                    selected: choiceChip.isSelected,
                    onSelected: (dummyValue) =>
                        Provider.of<RoutinesViewModel>(context, listen: false)
                            .selectChip(index, choiceChip.label),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(context);
                Provider.of<RoutinesViewModel>(context, listen: false)
                    .createRoutine(controller.text);
                controller.text = '';
              }
            },
            child: const Text('Create!'),
          ),
        ],
      );
    },
  );
}
