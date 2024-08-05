part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterPlusOne extends CounterState {}

final class CounterMinusOne extends CounterState {}
final class CounterReset extends CounterState {}
