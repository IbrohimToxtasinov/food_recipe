import 'package:food_recipe/data/models/food_model/food_model.dart';

abstract class FetchAllBlocState {}

class InitialFoodsBlocState extends FetchAllBlocState {}

class LoadFoodsBlocInProgress extends FetchAllBlocState {}

class LoadFoodsBlocInSuccess extends FetchAllBlocState {
  LoadFoodsBlocInSuccess({required this.foodModel});

  final FoodModel foodModel;
}

class LoadFoodsBlocInFailure extends FetchAllBlocState {
  LoadFoodsBlocInFailure({required this.errorText});

  final String errorText;
}