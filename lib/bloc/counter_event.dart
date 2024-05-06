// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterAddEvent extends CounterEvent {
  final double add;

  const CounterAddEvent({
    required this.add,
  });
}

class CounterSubstractEvent extends CounterEvent {
  final double minus;

  const CounterSubstractEvent({
    required this.minus,
  });
}

class CounterMultiplyEvent extends CounterEvent {
  final double multiply;

  const CounterMultiplyEvent({
    required this.multiply,
  });
}

class CounterDivideEvent extends CounterEvent {
  final double divide;

  const CounterDivideEvent({
    required this.divide,
  });
}
