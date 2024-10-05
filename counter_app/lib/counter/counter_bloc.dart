import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_app/app_logger.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterValue(0)) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
    on<ResetEvent>(_reset);
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    if (state is CounterValue) {
      final currentState = (state as CounterValue).value;
      emit(CounterValue(currentState + 1));
      AppLogger.info("Increment called: $state");
    }
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    if (state is CounterValue) {
      final currentState = (state as CounterValue).value;
      if (currentState > 0) emit(CounterValue(currentState - 1));
      AppLogger.info("Decrement called: $state");
    }
  }

  void _reset(ResetEvent event, Emitter<CounterState> emit) {
    if (state is CounterValue) {
      emit(const CounterValue(0));
    }
  }
}
