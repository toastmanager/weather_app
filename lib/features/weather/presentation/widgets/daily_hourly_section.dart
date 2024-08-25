import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/daily_weather_section.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_section.dart';

class DailyHourlySection extends StatefulWidget {
  const DailyHourlySection({super.key});

  @override
  State<DailyHourlySection> createState() => _DailyHourlySectionState();
}

class _DailyHourlySectionState extends State<DailyHourlySection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            tabs: const [Tab(text: 'Hour'), Tab(text: 'Week')]),
        const SizedBox(height: 8),
        SizedBox(
          height: 145,
          child: TabBarView(
            controller: _tabController,
            children: const [HourlyWeatherSection(), DailyWeatherSection()],
          ),
        )
      ],
    );
  }
}
