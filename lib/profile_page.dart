import 'package:counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                Navigator.of(context).pop();
              },
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return state is CounterStateOperated
                    ? Text(
                        state.value.toString(),
                        style: const TextStyle(fontSize: 40),
                      )
                    : state is CounterInitial
                        ? Text(
                            state.value.toString(),
                            style: const TextStyle(fontSize: 40),
                          )
                        : const SizedBox();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {context.read<CounterBloc>().add(const CounterAddEvent(add: 1))},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
