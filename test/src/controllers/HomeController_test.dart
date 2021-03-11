import 'package:api_example/data/TodoRepository.dart';
import 'package:api_example/data/models/TodoModel.dart';
import 'package:api_example/ui/Home/HomePageViewModel.dart';
import 'package:api_example/ui/Home/HomeState.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final viewModel = HomePageViewModel(repository);
  test('deve preencher a variavel todos', () async {
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);

    await viewModel.start();
    expect(viewModel.todos.isNotEmpty, true);
  });
  test('deve modificar o estado para error se a requisição falhar', () async {
    when(repository.fetchTodos()).thenThrow(Exception());

    expect(viewModel.state, HomeState.start);
    await viewModel.start();
    expect(viewModel.state, HomeState.error);
  });
}
