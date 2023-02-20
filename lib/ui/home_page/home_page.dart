import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFoodsBloc, FetchAllBlocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Page"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is LoadFoodsBlocInProgress
                  ? const Center(child: CircularProgressIndicator())
                  : state is LoadFoodsBlocInSuccess
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: state.foodModel.hints.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Column(
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(state
                                            .foodModel.hints[index].food.image)),
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      child: Text(state.foodModel.hints[index]
                                          .measures[2].label),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : state is LoadFoodsBlocInFailure
                          ? Center(
                              child: Text(state.errorText),
                            )
                          : SizedBox()
            ],
          ),
        );
      },
    );
  }
}
