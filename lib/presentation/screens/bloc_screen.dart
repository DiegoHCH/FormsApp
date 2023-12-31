import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter-bloc/counter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [int value = 1] ) {
    context.read<CounterBloc>()
    .add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) => Text('Bloc Counter : ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().add(CounterReset()), 
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
          child: context.select(
        (CounterBloc counterBloc) =>
            Text('Counter value : ${counterBloc.state.counter}'),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy(context, 3),
            child: const Text('+3'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy(context),
            child: const Text('+1'),
          )
        ],
      ),
    );
  }
}
