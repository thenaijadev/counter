import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterAddEvent>((event, emit) {
      final int addWhat = event.add;

      final state = this.state;

      if (state is CounterInitial) {
        final int value = state.value;
        emit(CounterStateAdded(value: value + addWhat));
      }

      if (state is CounterStateAdded) {
        final int value = state.value;
        print(addWhat);
        emit(CounterStateAdded(value: value + addWhat));
      }
    });

    on<CounterSubstractEvent>((event, emit) {});
  }
}
