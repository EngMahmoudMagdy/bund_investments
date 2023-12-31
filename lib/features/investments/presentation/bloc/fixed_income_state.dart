part of 'fixed_income_bloc.dart';

@immutable
abstract class FixedIncomeState {}

class FixedIncomeInitial extends FixedIncomeState {}

class LoadingState extends FixedIncomeState {}

class ErrorState extends FixedIncomeState {
  final String message;

  ErrorState(this.message);
}

class BondsLoaded extends FixedIncomeState {
  final List<Bond> bondList;

  BondsLoaded({required this.bondList});
}
