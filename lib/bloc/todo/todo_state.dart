abstract class TodoState {}

class InitState extends TodoState {}

class ListModifiedState extends TodoState {
  ListModifiedState();
}

class DeleteSelectedState extends TodoState {
  DeleteSelectedState();
}
// add whatever state you need to