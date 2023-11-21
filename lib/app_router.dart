import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12/data/reposetory/productsReposetory.dart';
import 'package:untitled12/presentation/screens/splash_screen.dart';

import 'business_logic/cubit/app_cubit.dart';
import 'constants/strings/strings.dart';
import 'data/api/web_services.dart';

class AppRouter {
  late ProductsRepository productsRepository;
  late ProductsCubit productsCubit;

  AppRouter() {
    productsRepository = ProductsRepository(ProductsWebServices());
    productsCubit = ProductsCubit(productsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => productsCubit,
                  child: const SplashScreen(),
                ));

      /// ولو هتنقل لصفحه تانيه
      ///هيبقي بالطريقه دي
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
