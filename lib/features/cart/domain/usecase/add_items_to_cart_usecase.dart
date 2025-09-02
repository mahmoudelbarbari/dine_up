import '../../../event/domain/entities/event_entities.dart';
import '../../../restaurant/data/model/menu_model.dart';
import '../reporisatory/cart_reporisatory.dart';

class AddProductToCartUsecase {
  final CartReporisatoryInterface cartReporisatoryInterface;
  AddProductToCartUsecase(this.cartReporisatoryInterface);

  Future<BaseResponse> call(MenuModel menuModel) async {
    return await cartReporisatoryInterface.addProductToCart(menuModel);
  }
}
