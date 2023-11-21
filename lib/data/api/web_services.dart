import 'package:dio/dio.dart';
import 'package:untitled12/constants/strings/strings.dart';

class ProductsWebServices {
  late Dio dio;
  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      print(response.data.toString());
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
