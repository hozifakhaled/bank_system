import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/withdraws/presentation/manger/cubit/withdraw_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WithdrawFormWidget extends StatelessWidget {
  const WithdrawFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WithdrawCubit, WithdrawState>(
      listener: (context, state) {
  if (state is WithdrawSuccess) {
          GoRouter.of(context).push(Routes.dataDepositAndWithdraw, extra: state.withdraw);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Enter Withdraw Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'e.g. 500',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: const Icon(Icons.money_rounded),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   if (context
                      .read<WithdrawCubit>()
                      .amountController
                      .text
                      .isNotEmpty) {
                    final amountText = context
                        .read<WithdrawCubit>()
                        .amountController
                        .text;
                    final amount = double.tryParse(amountText) ?? 0.0;
                    context.read<WithdrawCubit>().withdraw(amount);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: maincolor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: state is WithdrawLoading ? const CircularProgressIndicator(color: Colors.white) : const Text(
                  'Confirm Withdraw',
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
