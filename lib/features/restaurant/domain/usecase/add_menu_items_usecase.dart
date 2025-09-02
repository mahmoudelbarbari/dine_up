import '../../../event/domain/entities/event_entities.dart';
import '../../data/model/menu_model.dart';
import '../reporisatory/restaurant_reporisatory.dart';

class AddMenuItemsUsecase {
  final RestaurantReporisatory restaurantReporisatory;
  AddMenuItemsUsecase(this.restaurantReporisatory);

  Future<BaseResponse> call(MenuModel menuModel) async {
    return await restaurantReporisatory.addMenuItems(menuModel);
  }
}
