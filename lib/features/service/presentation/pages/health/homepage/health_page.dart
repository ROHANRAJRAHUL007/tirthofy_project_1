import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/health/widgets/banner_widget.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/health/widgets/category_grid.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/health/widgets/merchant_info.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.green),
        ),

        title: const Text(
          "Health",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_city, color: Colors.green),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [BannerWidget(), CategoryGrid(), MerchantInfo()],
        ),
      ),
    );
  }
}
