import '../../datasources/provider.dart';
import '../../model/foodmodel.dart';

class Repository {
  Provider startScreenProviders = Provider();

  Future <List<FoodModel>> getFooddetails() =>
      startScreenProviders.getFooddetails();
}
