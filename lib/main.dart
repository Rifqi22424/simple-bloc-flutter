import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drink_bloc.dart';
import 'models/drink_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrinkBloc()..add(LoadDrinkCounter())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DrinkBloc, DrinkState>(
          builder: (context, state) {
            if (state is DrinkInitial) {
              return const CircularProgressIndicator(color: Colors.blue);
            }
            if (state is DrinkLoaded) {
              return Column(
                children: [
                  Text(
                    '${state.drinks.length}',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.hardEdge,
                      children: [
                        for (int index = 0;
                            index < state.drinks.length;
                            index++)
                          Positioned(
                            left: Random.secure()
                                .nextInt(
                                    (MediaQuery.of(context).size.width.toInt() -
                                        150))
                                .toDouble(),
                            top: Random.secure()
                                .nextInt(
                                    (MediaQuery.of(context).size.height / 2)
                                            .toInt() -
                                        150)
                                .toDouble(),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.drinks[index].image,
                            ),
                          )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Text("Something went wrong!");
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<DrinkBloc>().add(AddDrink(Drink.drinks[0])),
            child: const Icon(Icons.local_drink_outlined, color: Colors.white),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<DrinkBloc>().add(RemoveDrink(Drink.drinks[0])),
            child: const Icon(Icons.close, color: Colors.white),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<DrinkBloc>().add(AddDrink(Drink.drinks[1])),
            child: const Icon(Icons.local_drink, color: Colors.white),
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                context.read<DrinkBloc>().add(RemoveDrink(Drink.drinks[1])),
            child: const Icon(Icons.close, color: Colors.white),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
