import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/list_shimmer.dart';
import '../../domain/entity/shop_basket_entity.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';
import '../widget/checkout_progress_indicator.dart';
import '../widget/checkout_shop_group_card.dart';

class PersianFormatter {
  PersianFormatter._();
  static String price(num value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value).toPersianDigit;
  }
}

class ScreenCheckout extends StatefulWidget {
  final ShopBasketEntity basket;
  const ScreenCheckout({super.key, required this.basket});

  @override
  State<ScreenCheckout> createState() => _ScreenCheckoutState();
}

class _ScreenCheckoutState extends State<ScreenCheckout> {
  late final CheckoutBloc _bloc;
  final Map<String, TextEditingController> _discountControllers = {};

  @override
  void initState() {
    super.initState();
    _bloc = locator<CheckoutBloc>();
    for (var group in widget.basket.shopGroups) {
      _discountControllers[group.repairmanId] = TextEditingController();
    }
    _bloc.add(FetchCheckoutInitialDataEvent(
      widget.basket.shopGroups.map((g) => g.repairmanId).toList(),
    ));
  }

  @override
  void dispose() {
    for (var controller in _discountControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final allRepairmanIds =
        widget.basket.shopGroups.map((g) => g.repairmanId).toList();

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: BlocProvider.value(
        value: _bloc,
        child: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutLoaded) {
              if (state.successMessage != null) {
                CstmSnackBar.showSuccess(context, state.successMessage!);
                if (state.successMessage!.contains("سفارش")) {
                  context.go('/orders');
                }
              }
              if (state.errorMessage != null) {
                CstmSnackBar.showError(context, state.errorMessage!);
              }
            }
          },
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return ListShimmer(height: 120);
            }
            if (state is CheckoutError) {
              return ErrorStateWidget(
                message: state.message,
                onRetry: () => _bloc.add(FetchCheckoutInitialDataEvent(
                  allRepairmanIds,
                )),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                children: [
                  const CheckoutProgressIndicator(),
                  Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 40.h),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              ...widget.basket.shopGroups.map(
                                (group) => CheckoutShopGroupCard(
                                  group: group,
                                  state: state,
                                  bloc: _bloc,
                                  discountControllers: _discountControllers,
                                  allRepairmanIds: allRepairmanIds,
                                ),
                              ),
                              SizedBox(height: 40.h),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
