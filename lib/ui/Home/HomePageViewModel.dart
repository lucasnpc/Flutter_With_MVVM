import 'package:api_example/data/TodoRepository.dart';
import 'package:api_example/data/models/TodoModel.dart';
import 'package:flutter/material.dart';

import 'HomeState.dart';

class HomePageViewModel extends ChangeNotifier {
  List<TodoModel> todos = [];
  TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomePageViewModel([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.sucess;
      notifyListeners();
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
