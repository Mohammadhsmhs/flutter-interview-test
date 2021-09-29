import 'package:flutter/material.dart';

class EditTodoDialog extends StatelessWidget {
  final String text;
  EditTodoDialog({required this.text, Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = text;
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -32,
              right: 50,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 55,
                ),
                radius: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Edit Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: controller,

                    // style: const TextStyle(color: ),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                          width: 1,
                        ),
                      ),
                      hintText: "Note",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                side: BorderSide(
                                  width: 2,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                minimumSize: const Size(70, 30),
                                primary:
                                    Theme.of(context).colorScheme.secondary),
                            onPressed: () {
                              // ignore: avoid_print
                              print("controller value is ${controller.text}");
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(90, 30),
                              primary: Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                            },
                            child: const Text("Save"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
