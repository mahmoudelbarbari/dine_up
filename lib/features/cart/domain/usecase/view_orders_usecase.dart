import '../../../restaurant/data/model/menu_model.dart';
import '../reporisatory/cart_reporisatory.dart';

class ViewOrderUsecase {
  final CartReporisatoryInterface cartReporisatoryInterface;
  ViewOrderUsecase(this.cartReporisatoryInterface);

  Future<List<MenuModel>> call() async {
    return await cartReporisatoryInterface.viewOrders();
  }
}
