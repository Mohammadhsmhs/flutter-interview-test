import 'package:flutter/material.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_interview_test/domain/validators/todo_validator.dart';
import 'package:flutter_interview_test/presentation/dialogs/todo/add_todo_dialog.dart';
import 'package:flutter_interview_test/presentation/dialogs/todo/edit_todo_dialog.dart';
import 'package:provider/src/provider.dart';

class TodoItem extends StatefulWidget {
  String title;
  int index;

  TodoItem({required this.title, required this.index}) : super();

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  var value = false;
  late TodoCubit todoCubit;
  @override
  Widget build(BuildContext context) {
    todoCubit = context.read<TodoCubit>();
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          },
        ),
        Container(
          width: (MediaQuery.of(context).size.width) * .6,
          padding: const EdgeInsets.all(8),
          child: Text(widget.title),
        ),
        IconButton(
          onPressed: () {
            showTodoDialog(context);
          },
          icon: const Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            todoCubit.deleteToDo(widget.index);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  void showTodoDialog(BuildContext context) {
    const radius = 20.0;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      context: context,
      isDismissible: true,
      builder: (context) => EditTodoDialog(text: todoCubit.todos[widget.index]),
    ).then((todoText) {
      if (TodoValidator.containsSpecialCharacters(todoText) &&
          TodoValidator.isNotEmpty(todoText)) {
        todoCubit.editTodo(todoText, widget.index);
      }
    });
  }
}
