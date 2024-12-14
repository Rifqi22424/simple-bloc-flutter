part of 'drink_bloc.dart';

sealed class DrinkState extends Equatable {
  const DrinkState();

  @override
  List<Object> get props => [];
}

final class DrinkInitial extends DrinkState {}

class DrinkLoaded extends DrinkState {
  final List<Drink> drinks;

  const DrinkLoaded({required this.drinks});

  @override
  List<Object> get props => [drinks];
}
