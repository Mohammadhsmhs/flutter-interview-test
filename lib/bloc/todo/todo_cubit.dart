import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<String> todos = [];

  TodoCubit() : super(InitState());

  void addTodo(String todoText) {
    todos.add(todoText);
    emit(ListModifiedState());
  }

  void editTodo(String editedText, int index) {
    todos[index] = editedText;
    emit(ListModifiedState());
  }

  void deleteToDo(int index) {
    todos.removeAt(index);
    emit(ListModifiedState());
  }
}
