import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/consts.dart';
import '../../domain/entity/repair_shop_entity.dart';

class WorkshopHeroImage extends StatelessWidget {
  final RepairShopEntity workshop;

  const WorkshopHeroImage({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String imageUrl = workshop.profileImageId != null && workshop.profileImageId!.isNotEmpty
        ? '${Consts.baseFileUrl}${workshop.profileImageId}'
        : workshop.imageUrl;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: theme.colorScheme.surfaceContainerHighest,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (_, _, _) => Container(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        alignment: Alignment.center,
        child: Icon(
          Icons.store_rounded,
          color: theme.colorScheme.primary.withValues(alpha: 0.3),
          size: 64.sp,
        ),
      ),
    );
  }
}
