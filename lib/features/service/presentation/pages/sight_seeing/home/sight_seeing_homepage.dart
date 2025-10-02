import 'package:flutter/material.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/sight_seeing/tabs/hourly_tab.dart';
import 'package:tirthofy_code_1/features/service/presentation/pages/sight_seeing/tabs/outstation_tab.dart';

class SightSeeingHomepage extends StatefulWidget {
  const SightSeeingHomepage({super.key});

  @override
  State<SightSeeingHomepage> createState() => _SightSeeingHomepageState();
}

class _SightSeeingHomepageState extends State<SightSeeingHomepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cab Search"),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Outstation"),
            // Tab(text: "Airport"),
            Tab(text: "Hourly Rentals"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [OutstationTab(), HourlyTab()],
      ),
    );
  }
}
