import 'package:api_example/ui/Home/HomePageViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomeState.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var viewModel;

  _sucess() {
    return ListView.builder(
      itemCount: viewModel.todos.length,
      itemBuilder: (context, index) {
        var todo = viewModel.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (bool value) {},
          ),
          title: Text('${todo.title}'),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          viewModel.start();
        },
        child: Text("Tente novamente"),
      ),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManager(HomeState state) {
    init();
    print('state manager');
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.sucess:
        return _sucess();
      case HomeState.error:
        return _error();
    }
  }

  void init() {
    viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<HomePageViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('List Todo\'s'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh_outlined),
                onPressed: () {
                  viewModel.start();
                })
          ],
        ),
        body: AnimatedBuilder(
          animation: viewModel.state,
          builder: (context, child) {
            return stateManager(viewModel.state.value);
          },
        ));
  }
}
