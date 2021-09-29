import 'package:flutter/material.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_state.dart';
import 'package:flutter_interview_test/domain/validators/todo_validator.dart';
import 'package:flutter_interview_test/presentation/dialogs/todo/add_todo_dialog.dart';
import 'package:flutter_interview_test/presentation/widgets/todo/todo_item.dart';

class Todo extends StatelessWidget {
  Todo({Key? key}) : super(key: key);

  late TodoCubit todoCubit;

  @override
  Widget build(BuildContext context) {
    todoCubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novaday's interview test"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showTodoDialog(context),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is ListModifiedState && todoCubit.todos.isNotEmpty) {
            return ListView.builder(
              itemCount: todoCubit.todos.length,
              itemBuilder: (context, index) => TodoItem(
                title: todoCubit.todos[index],
                index: index,
              ),
            );
          }
          return const Center(child: Text("Oops! nothing to show :("));
        },
      ),
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
      builder: (context) => AddTodoDialog(),
    ).then((todoText) {
      if (!TodoValidator.containsSpecialCharacters(todoText) &&
          TodoValidator.isNotEmpty(todoText)) {
        todoCubit.addTodo(todoText);
      }
    });
  }
}
