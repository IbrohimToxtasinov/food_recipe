import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/food_bloc/get_foods_state.dart';
import 'package:food_recipe/data/models/my_response.dart';
import 'package:food_recipe/data/repositories/food_repository.dart';
import 'get_foods_event.dart';

class GetFoodsBloc extends Bloc<UserCardsEvent, FetchAllBlocState> {
  GetFoodsBloc({required this.foodRepository})
      : super(InitialFoodsBlocState()) {
    on<FetchAllFoods>(_fetchAllAlbums);
  }

  final FoodRepository foodRepository;

  _fetchAllAlbums(
    FetchAllFoods event,
    Emitter<FetchAllBlocState> emit,
  ) async {
    //loading
    emit(LoadFoodsBlocInProgress());
    MyResponse myResponse = await foodRepository.getFoods(
      calories: event.calories,
      ingr: event.ingr,
    );
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadFoodsBlocInSuccess(foodModel: myResponse.data));
    } else {
      emit(LoadFoodsBlocInFailure(errorText: myResponse.error));
    }
  }
}
