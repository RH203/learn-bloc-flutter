part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterValue extends CounterState {
  final int value;
  const CounterValue(this.value);
  @override
  List<Object> get props => [value];
}
