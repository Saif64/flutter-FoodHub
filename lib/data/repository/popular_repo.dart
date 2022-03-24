import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularRepo extends GetxService {
  final ApiClient apiClient;

  PopularRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData('end point url');
  }
}
