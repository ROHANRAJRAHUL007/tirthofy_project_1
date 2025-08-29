import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/cart_page/cart_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/favourite_page/favourite_page.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/all_day_breakfast.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/bestsellerfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/cold_beverages.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/combo.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/desserts.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/meals.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/newlylaunched.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/under99.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/home_page_main_file/bloc/food_home_page_bloc.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/optionfood.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/snacktime.dart';

class Foodpage extends StatefulWidget {
  const Foodpage({super.key});

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  final FoodHomePageBloc homeBloc = FoodHomePageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodHomePageBloc, FoodHomePageState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is FoodHomePageActionState,
      buildWhen: (previous, current) => current is! FoodHomePageActionState,
      listener: (context, state) {
        if (state is NavigationToAddtoCartActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPageFood()),
          );
        } else if (state is NavigationToAddtoFavouriteActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavouritePageFood()),
          );
        }
        //
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Tirthofy Cafe")),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(FavouriteFoodClickedEvent());
                },
                icon: Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(FoodAddCartClickedEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
          body: ListView(
            children: [
              Optionfood(), // top section
              Buyfoodlist(), // grid or list of food items
              Snacktime(),
              AllDayBreakfast(),
              Newlylaunched(),
              Meals(),
              Under99(),
              Desserts(),
              Combo(),
              ColdBeverages(),
            ],
          ),
        );
      },
    );
  }
}
