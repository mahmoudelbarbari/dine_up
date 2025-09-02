import '../../../event/domain/entities/event_entities.dart';
import '../../domain/reporisatory/restaurant_reporisatory.dart';
import '../datasource/restaurant_datasource.dart';
import '../model/menu_model.dart';
import '../model/restaurant_model.dart';

class RestaurantReporisatoryImpl implements RestaurantReporisatory {
  final RestaurantDatasourceInterface restaurantDatasourceInterface;
  RestaurantReporisatoryImpl(this.restaurantDatasourceInterface);

  @override
  Future<BaseResponse> addRestaurant(RestaurantModel restaurantModel) async {
    return await restaurantDatasourceInterface.addRestaurant(restaurantModel);
  }

  @override
  Future<BaseResponse> uploadImage() async {
    return await restaurantDatasourceInterface.uploadImage();
  }

  @override
  Future<BaseResponse> addMenuItems(MenuModel menuModel) async {
    return await restaurantDatasourceInterface.addMenuItems(menuModel);
  }

  @override
  Future<List<RestaurantModel>> getAllRestaurant() async {
    return await restaurantDatasourceInterface.getAllRestaurant();
  }

  @override
  Future<List<MenuModel>> getAllMenu() async {
    return await restaurantDatasourceInterface.getAllMenu();
  }

  @override
  Future<BaseResponse> getUploadedImage() async {
    return await restaurantDatasourceInterface.getUploadedImage();
  }
}
