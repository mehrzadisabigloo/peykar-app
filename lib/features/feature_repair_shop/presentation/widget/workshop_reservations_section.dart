import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/repair_shop_entity.dart';
import 'workshop_section_header.dart';
import 'workshop_reservation_card.dart';

class WorkshopReservationsSection extends StatelessWidget {
  final RepairShopEntity workshop;
  final VoidCallback onSeeAll;

  const WorkshopReservationsSection({
    super.key,
    required this.workshop,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    final reservations = workshop.userReservations;
    if (reservations.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkshopSectionHeader(
          title: 'رزروهای من در این تعمیرگاه',
          onSeeAll: onSeeAll,
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: reservations.length,
            itemBuilder: (context, index) => WorkshopReservationCard(reservation: reservations[index]),
          ),
        ),
      ],
    );
  }
}
