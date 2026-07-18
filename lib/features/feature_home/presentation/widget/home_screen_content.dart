import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_header.dart';
import 'home_banner.dart';
import 'my_cars_section.dart';
import 'upcoming_services_section.dart';
import 'services_near_you_section.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      child: SingleChildScrollView(
        child: Column(
          spacing: 10.h,
          children: const [
            HomeBanner(),
            MyCarsSection(),
            UpcomingServicesSection(),
            ServicesNearYouSection(),
          ],
        ),
      ),
    );
  }
}
