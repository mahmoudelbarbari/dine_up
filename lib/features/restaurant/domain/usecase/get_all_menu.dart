import '../../data/model/menu_model.dart';
import '../reporisatory/restaurant_reporisatory.dart';

class GetAllMenuUsecase {
  final RestaurantReporisatory restaurantReporisatory;
  GetAllMenuUsecase(this.restaurantReporisatory);

  Future<List<MenuModel>> call() async {
    return await restaurantReporisatory.getAllMenu();
  }
}
