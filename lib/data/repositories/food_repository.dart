import 'package:food_recipe/data/models/my_response.dart';
import 'package:food_recipe/services/api_service/api_service.dart';

class FoodRepository {
  FoodRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getFoods({
    required String ingr,
    required String calories,
  }) =>
      apiService.getFoods(ingr: ingr, calories: calories);
}
