import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/deposits/presentation/manger/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DepositFormWidget extends StatelessWidget {
  const DepositFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<DepositCubit, DepositState>(
      listener: (context, state) {
        if (state is DepositSuccess) {
          GoRouter.of(context).push(Routes.dataDepositAndWithdraw, extra: state.depositEntity);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Enter Deposit Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: context.read<DepositCubit>().amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g. 500',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: const Icon(Icons.attach_money_rounded),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (context
                      .read<DepositCubit>()
                      .amountController
                      .text
                      .isNotEmpty) {
                    final amountText = context
                        .read<DepositCubit>()
                        .amountController
                        .text;
                    final amount = double.tryParse(amountText) ?? 0.0;
                    context.read<DepositCubit>().createDeposit(amount);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: maincolor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Confirm Deposit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
