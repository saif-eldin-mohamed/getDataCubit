import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12/business_logic/cubit/app_cubit.dart';
import 'package:untitled12/data/models/productsModels.dart';

import '../widgets/character_item.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  late List<ProductsModel> allProducts;

  @override
  void initState() {
    super.initState();
    allProducts = BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  Widget buildBlocWidget() {
    /// هنا الBlocBuilder
    return BlocBuilder<ProductsCubit, AppState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = (state).products;
          return ListItemBuilder();
        } else {
          return Image.asset('assets/images/loading.gif');
        }
      },
    );
  }

  Widget ListItemBuilder() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          /// معناها كام واحده ف كل سطر
          crossAxisCount: 2,

          /// بتعمل منها المسافه بين كل عنصر والتاني
          childAspectRatio: 2 / 3,

          ///

          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            model: allProducts[index],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: buildBlocWidget(),
    );
  }
}
