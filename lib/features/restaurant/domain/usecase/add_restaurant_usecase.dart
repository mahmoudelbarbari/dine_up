import '../../../event/domain/entities/event_entities.dart';
import '../../data/model/restaurant_model.dart';
import '../reporisatory/restaurant_reporisatory.dart';

class AddRestaurantUsecase {
  final RestaurantReporisatory restaurantReporisatory;

  AddRestaurantUsecase(this.restaurantReporisatory);

  Future<BaseResponse> call(RestaurantModel restaurantModel) async {
    return await restaurantReporisatory.addRestaurant(restaurantModel);
  }
}
