import '../api/web_services.dart';
import '../models/productsModels.dart';

class ProductsRepository {
  final ProductsWebServices productsWebServices;

  ProductsRepository(this.productsWebServices);

  Future<List<ProductsModel>> getAllProducts() async {
    final products = await productsWebServices.getAllProducts();
    return products
        .map((products) => ProductsModel.fromJson(products))
        .toList();
  }
}
