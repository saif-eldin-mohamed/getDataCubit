part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class ProductsInitial extends AppState {}

class ProductsLoaded extends AppState {
  final List<ProductsModel> products;

  ProductsLoaded(this.products);
}
