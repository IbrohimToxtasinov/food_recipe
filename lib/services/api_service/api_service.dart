import 'package:dio/dio.dart';
import 'package:food_recipe/data/models/food_model/food_model.dart';
import 'package:food_recipe/data/models/my_response.dart';
import 'package:food_recipe/services/api_service/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getFoods(
      {required String ingr, required String calories}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.get(
          "${dio.options.baseUrl}/api/food-database/v2/parser?app_id=aa5db940&app_key=b608892a5d30ffc4eb6e7bb39e548ac3&ingr=$ingr&calories=$calories");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = FoodModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
      print(error);
    }
    return myResponse;
  }
}
