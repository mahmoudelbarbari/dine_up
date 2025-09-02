import '../../../event/domain/entities/event_entities.dart';
import '../reporisatory/restaurant_reporisatory.dart';

class UploadImageUsecase {
  final RestaurantReporisatory restaurantReporisatory;
  UploadImageUsecase(this.restaurantReporisatory);

  Future<BaseResponse> call() async {
    return await restaurantReporisatory.uploadImage();
  }
}
