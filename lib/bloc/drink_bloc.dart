import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/drink_model.dart';

part 'drink_event.dart';
part 'drink_state.dart';

class DrinkBloc extends Bloc<DrinkEvent, DrinkState> {
  DrinkBloc() : super(DrinkInitial()) {
    on<LoadDrinkCounter>(
      (event, emit) async {
        await Future.delayed(const Duration(seconds: 1));
        emit(const DrinkLoaded(drinks: <Drink>[]));
      },
    );
    on<AddDrink>(
      (event, emit) async {
        if (state is DrinkLoaded) {
          final state = this.state as DrinkLoaded;
          emit(
            DrinkLoaded(drinks: List.from(state.drinks)..add(event.drink)),
          );
        }
      },
    );
    on<RemoveDrink>(
      (event, emit) async {
        if (state is DrinkLoaded) {
          final state = this.state as DrinkLoaded;
          emit(
            DrinkLoaded(drinks: List.from(state.drinks)..remove(event.drink)),
          );
        }
      },
    );
  }
}
