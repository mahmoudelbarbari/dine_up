import '../../../event/domain/entities/event_entities.dart';
import '../../../restaurant/data/model/menu_model.dart';
import '../../domain/reporisatory/cart_reporisatory.dart';
import '../datasource/cart_datasource.dart';

class CartReporisatoryImpl implements CartReporisatoryInterface {
  final CartDatasourceInterface cartDatasourceInterface;
  CartReporisatoryImpl(this.cartDatasourceInterface);

  @override
  Future<BaseResponse> addProductToCart(MenuModel menuModel) async {
    return await cartDatasourceInterface.addProductToCart(menuModel);
  }

  @override
  Future<List<MenuModel>> getAllCartItems() async {
    return await cartDatasourceInterface.getAllCartItems();
  }

  @override
  Future<List<MenuModel>> viewOrders() async {
    return await cartDatasourceInterface.viewwOrder();
  }

  @override
  Future<BaseResponse> clearCartItems() async {
    return await cartDatasourceInterface.clearCartItems();
  }
}
