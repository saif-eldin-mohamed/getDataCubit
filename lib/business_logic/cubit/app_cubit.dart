import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled12/data/models/productsModels.dart';

import '../../data/reposetory/productsReposetory.dart';

part 'app_state.dart';

class ProductsCubit extends Cubit<AppState> {
  final ProductsRepository productsRepository;
  List<ProductsModel> Myproduct = [];
  ProductsCubit(
    this.productsRepository,
  ) : super(ProductsInitial());
  List<ProductsModel> getAllProducts() {
    productsRepository.getAllProducts().then((products) {
      emit(ProductsLoaded(products));
      this.Myproduct = products;
    });
    return Myproduct;
  }
}
