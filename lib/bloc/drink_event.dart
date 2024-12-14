part of 'drink_bloc.dart';

sealed class DrinkEvent extends Equatable {
  const DrinkEvent();

  @override
  List<Object> get props => [];
}

class LoadDrinkCounter extends DrinkEvent {}

class AddDrink extends DrinkEvent {
  final Drink drink;

  const AddDrink(this.drink);

  @override
  List<Object> get props => [drink];
}

class RemoveDrink extends DrinkEvent {
  final Drink drink;

  const RemoveDrink(this.drink);

  @override
  List<Object> get props => [drink];
}
