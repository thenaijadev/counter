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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              listener: (context, state) {
                if (state is CounterStateAdded) {
                  if (state.value % 5 == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ProfilePage(title: "Profile")));
                  }
                }
              },
              builder: (context, state) {
                return state is CounterStateAdded
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
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {context.read<CounterBloc>().add(const CounterAddEvent(add: 5))},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
