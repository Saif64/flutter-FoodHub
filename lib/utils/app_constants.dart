class AppConstants {
  static const String APP_NAME = 'FOODHUB';
  static const int APP_VERSION = 1;

  static const String BASE_URL =
      'http://10.0.2.2:8000'; //http://mvs.bslmeiyu.com
  static const String POPULAR_FOOD_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_FOOD_URL = '/api/v1/products/recommended/';
  static const String UPLOAD_URL = '/uploads/';

  static const String REGISTER_URI = '/api/v1/auth/register/';

  static const String TOKEN = 'saifToken';
  static const String CART_LIST = 'cart-list';
  static const String CART_HISTORY_LIST = 'cart-history-list';
}
