import 'package:flutter/material.dart';
import 'package:counter_app/counter/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Counter app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterValue) {
                  return Text(
                    "${state.value}",
                    style: const TextStyle(fontSize: 30),
                  );
                } else {
                  return const Text(
                    "0",
                    style: TextStyle(fontSize: 30),
                  );
                }
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.outlined(
                  onPressed: () => counterBloc.add(ResetEvent()),
                  icon: const Icon(Icons.undo),
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton.outlined(
                  onPressed: () => counterBloc.add(IncrementEvent()),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 50,
                ),
                IconButton.outlined(
                  onPressed: () => counterBloc.add(DecrementEvent()),
                  icon: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
