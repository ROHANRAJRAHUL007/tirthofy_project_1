import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/mart/widgets/promo_banner.dart';
import '../widgets/appbar_custom.dart';
import '../widgets/search_bar_custom.dart';
import '../widgets/categories_row.dart';
import '../widgets/grid_section.dart';

class GiftHomepage extends StatelessWidget {
  const GiftHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarCustom(),
      ),
      body: ListView(
        children: const [
          SearchBarCustom(),
          CategoriesRow(),
          GridSection(),
          PromoBanner(),
        ],
      ),
    );
  }
}
