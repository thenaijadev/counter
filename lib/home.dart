import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is CounterInitial) {
                  return Text(
                    state.value.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                }
                if (state is CounterStateOperated) {
                  return Text(
                    state.value.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProfilePage(title: "Profile")));
                },
                child: const Text("Next Screen"))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => {
              context.read<CounterBloc>().add(const CounterAddEvent(add: 1))
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => {
              context
                  .read<CounterBloc>()
                  .add(const CounterSubstractEvent(minus: 1))
            },
            tooltip: 'minus',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => {
              context
                  .read<CounterBloc>()
                  .add(const CounterDivideEvent(divide: 5))
            },
            tooltip: 'divide',
            child: const Icon(Icons.percent),
          ),
          FloatingActionButton(
            onPressed: () => {
              context
                  .read<CounterBloc>()
                  .add(const CounterMultiplyEvent(multiply: 2))
            },
            tooltip: 'multiply',
            child: const Icon(Icons.emergency_rounded),
          ),
        ],
      ),
    );
  }
}
