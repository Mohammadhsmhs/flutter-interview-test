import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  AddTodoDialog({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(
                  Icons.add,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      "Add to me ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
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
                                  color: Theme.of(context).accentColor,
                                ),
                                minimumSize: Size(70, 30),
                                primary: Theme.of(context).accentColor),
                            onPressed: () {
                              print("controller value is ${controller.text}");
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: Size(90, 30),
                              primary: Theme.of(context).accentColor,
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
