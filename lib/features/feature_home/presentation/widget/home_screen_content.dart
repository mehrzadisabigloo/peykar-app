import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/widget_infinite_list.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../base/base_home_stateful_widget_state.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../bloc/main_home_page_bloc.dart';
import 'category_grid_shimmer.dart';
import 'home_banner.dart';
import 'job_categories_grid.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends BaseHomeStatefulWidgetState<HomeScreenContent, HomeBloc> {
  _HomeScreenContentState() : super(locator<HomeBloc>());

  @override
  void initState() {
    super.initState();
    final role = context.read<MainHomePageBloc>().state.role;
    bloc.add(FetchHomeDataEvent(role: role));
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surfaceContainerLow,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          List<BannerEntity> banners = [];
          if (state is HomeLoaded) {
            banners = state.banners;
          } else if (state is HomeLoadingMore) {
            banners = state.banners;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (banners.isNotEmpty) HomeBanner(banners: banners),
              JobCategoriesGrid.buildHeader(context),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state is HomeLoading) {
                      return const CategoryGridShimmer();
                    }
                    if (state is HomeError) {
                      return ErrorStateWidget(
                        message: state.message,
                        onRetry: () {
                          final role = context.read<MainHomePageBloc>().state.role;
                          bloc.add(FetchHomeDataEvent(role: role));
                        },
                      );
                    }

                    List<OccupationEntity> occupations = [];
                    bool hasMore = false;
                    bool hasError = false;
                    String? errorMessage;

                    if (state is HomeLoaded) {
                      occupations = state.occupations;
                      hasMore = state.hasMore;
                      errorMessage = state.errorMessage;
                      if (occupations.isEmpty && errorMessage != null) {
                        hasError = true;
                      }
                    } else if (state is HomeLoadingMore) {
                      occupations = state.occupations;
                      hasMore = state.hasMore;
                    }

                    if (occupations.isEmpty && !hasError && state is! HomeLoading) {
                      return const EmptyStateWidget(
                        title: 'دسته‌ای یافت نشد',
                        description: 'در حال حاضر هیچ دسته شغلی فعالی وجود ندارد.',
                      );
                    }

                    return WidgetInfiniteList(
                      bloc: bloc.listBloc,
                      items: occupations,
                      hasReachedTop: true,
                      hasReachedBottom: !hasMore,
                      isLoading: false,
                      hasErrorOccurred: hasError,
                      errorWidget: ErrorStateWidget(
                        message: errorMessage ?? "خطا در بارگذاری",
                        onRetry: () => bloc.add(LoadMoreHomeDataEvent()),
                      ),
                      loadingWidget: const CategoryGridShimmer(),
                      loadBottomData: () => bloc.add(LoadMoreHomeDataEvent()),
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                      builder: (context, item) {
                        return CategoryItem(occupation: item as OccupationEntity);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
