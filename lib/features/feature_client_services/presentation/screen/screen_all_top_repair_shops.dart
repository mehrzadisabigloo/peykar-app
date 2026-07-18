import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_client_services_stateful_widget_state.dart';
import '../bloc/top_repair_shops/top_repair_shops_bloc.dart';
import '../widget/repair_shop_card.dart';

class ScreenAllTopRepairShops extends StatefulWidget {
  const ScreenAllTopRepairShops({super.key});

  @override
  State<ScreenAllTopRepairShops> createState() => _ScreenAllTopRepairShopsState();
}

class _ScreenAllTopRepairShopsState extends BaseClientServicesStatefulWidgetState<ScreenAllTopRepairShops, TopRepairShopsBloc> {
  _ScreenAllTopRepairShopsState() : super(locator<TopRepairShopsBloc>());

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchTopRepairShopsEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      bloc.add(LoadMoreTopRepairShopsEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return BlocBuilder<TopRepairShopsBloc, TopRepairShopsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is TopRepairShopsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TopRepairShopsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: TextStyle(fontSize: 14.sp, color: Colors.red)),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => bloc.add(FetchTopRepairShopsEvent()),
                    child: const Text('تلاش دوباره'),
                  ),
                ],
              ),
            );
          }

          if (state is TopRepairShopsLoaded) {
            if (state.shops.isEmpty) {
              return const Center(child: Text('تعمیرگاهی یافت نشد.'));
            }

            return Container(
              color: const Color(0xFFF8F9FA),
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(20.r),
                itemCount: state.hasReachedMax ? state.shops.length : state.shops.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.shops.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return RepairShopCard(shop: state.shops[index]);
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      );
  }
}
