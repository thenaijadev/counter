// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterAddEvent extends CounterEvent {
  final int add;

  const CounterAddEvent({
    required this.add,
  });
}

class CounterSubstractEvent extends CounterEvent {
  final int minusWhat;
  const CounterSubstractEvent({
    required this.minusWhat,
  });
}
