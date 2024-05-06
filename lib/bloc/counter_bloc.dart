import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterAddEvent>((event, emit) {
      final double addWhat = event.add;

      final state = this.state;

      if (state is CounterInitial) {
        final double value = state.value;
        emit(CounterStateOperated(value: value + addWhat));
      }

      if (state is CounterStateOperated) {
        final double value = state.value;
        emit(CounterStateOperated(value: value + addWhat));
      }
    });

    on<CounterSubstractEvent>((event, emit) {
      final double minusWhat = event.minus;

      final state = this.state;

      if (state is CounterInitial) {
        final double value = state.value;
        emit(CounterStateOperated(value: value - minusWhat));
      }

      if (state is CounterStateOperated) {
        final double value = state.value;

        emit(CounterStateOperated(value: value - minusWhat));
      }
    });

    on<CounterDivideEvent>((event, emit) {
      final double divideWhat = event.divide;

      final state = this.state;

      if (state is CounterInitial) {
        final double value = state.value;
        emit(CounterStateOperated(value: value / divideWhat));
      }

      if (state is CounterStateOperated) {
        final double value = state.value;
        emit(CounterStateOperated(value: value / divideWhat));
      }
    });

    on<CounterMultiplyEvent>((event, emit) {
      final double multiplyWhat = event.multiply;

      final state = this.state;

      if (state is CounterInitial) {
        final double value = state.value;
        emit(CounterStateOperated(value: value * multiplyWhat));
      }

      if (state is CounterStateOperated) {
        final double value = state.value;
        emit(CounterStateOperated(value: value * multiplyWhat));
      }
    });
  }
}
