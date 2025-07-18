import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/home/presentation/manegar/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:bank_system/features/home/presentation/manegar/home_cubit/home_cubit.dart';
import 'package:bank_system/features/home/presentation/widgets/custom_bottom_sheet_diposit.dart';
import 'package:bank_system/features/home/presentation/widgets/custom_bottom_sheet_withdraw.dart';
import 'package:bank_system/features/home/presentation/widgets/quick_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: BlocProvider(
        create: (context) => sl<HomeCubit>()..getCategories(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: InkWell(
                      onTap: () async {
  if (index == 1) {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => sl<DepositCubit>(),
        child: const CustomBottomSheetDiposit(),
      ),
    );
  }
  if (index == 0) {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => BlocProvider(
        create: (context) => sl<DepositCubit>(),
        child: const CustomBottomSheetWithdraw(),
      ),
    );
  }
   if (index == 2) {
    GoRouter.of(context).push(Routes.balance);
  }
},
                      child: QuickActionItem(
                        icon: state.categories[index].image,
                        label: state.categories[index].categoryName,
                        iconColor: maincolor,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
