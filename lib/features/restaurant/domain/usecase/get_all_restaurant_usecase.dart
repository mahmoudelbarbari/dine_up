import '../../data/model/restaurant_model.dart';
import '../reporisatory/restaurant_reporisatory.dart';

class GetAllRestaurantUsecase {
  final RestaurantReporisatory restaurantReporisatory;
  GetAllRestaurantUsecase(this.restaurantReporisatory);

  Future<List<RestaurantModel>> call() async {
    return await restaurantReporisatory.getAllRestaurant();
  }
}
