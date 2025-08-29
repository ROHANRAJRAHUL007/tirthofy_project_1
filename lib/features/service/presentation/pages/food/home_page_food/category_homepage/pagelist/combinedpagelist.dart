import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/all_day_breakfast.dart';

import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/cold_beverages.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/combo.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/desserts.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/meals.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/newlylaunched.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/snacktime.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/food/home_page_food/category_homepage/under99.dart';

final List<Widget> foodlistpages = [
  const AllDayBreakfast(),
  const ColdBeverages(),
  const Combo(),
  const Desserts(),
  const Meals(),
  const Newlylaunched(),
  const Snacktime(),
  const Under99(),
];
