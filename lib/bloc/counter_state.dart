// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {
  final double value;
  const CounterInitial({this.value = 0});
  @override
  List<Object> get props => [value];
}

class CounterStateOperated extends CounterState {
  final double value;
  const CounterStateOperated({required this.value});
  @override
  List<Object> get props => [value];
}
