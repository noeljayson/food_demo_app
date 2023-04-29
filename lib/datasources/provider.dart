import 'package:food_demo_app/model/foodmodel.dart';

import '../config/serveraddress.dart';
import '../domain/entities/Restapi.dart';
import '../domain/entities/app_exceptions.dart';

class Provider {
  /// food list
  Future<List<FoodModel>> getFooddetails() async {
    try {
      print("Loading from api");
      var res = await RestAPI().post(ServerAddresses.foodmenulist);

      print(res);
      return foodModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
}
