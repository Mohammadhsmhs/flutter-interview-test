import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interview_test/bloc/todo/todo_cubit.dart';
import 'package:flutter_interview_test/presentation/screens/ToDo/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.teal.shade900,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: Colors.white),
            ),
        // dialogBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
        dialogBackgroundColor: Color.fromRGBO(9, 6, 20, 1),
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: Todo(),
      ),
    );
  }
}
