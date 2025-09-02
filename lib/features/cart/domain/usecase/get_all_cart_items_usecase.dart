import '../../../restaurant/data/model/menu_model.dart';
import '../reporisatory/cart_reporisatory.dart';

class GetAllCartItemsUsecase {
  final CartReporisatoryInterface cartReporisatoryInterface;
  GetAllCartItemsUsecase(this.cartReporisatoryInterface);

  Future<List<MenuModel>> call() async {
    return await cartReporisatoryInterface.getAllCartItems();
  }
}
