import 'package:bank_system/core/widgets/custom_navbar.dart';
import 'package:bank_system/features/withdraws/presentation/manger/cubit/withdraw_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawHeaderWidget extends StatelessWidget {

  const WithdrawHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: maincolor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Available Balance',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 8),
             state is BalanceLoaded? Text(
                '\$${state.balance.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )  : state is BalanceLoading ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ):SizedBox(),
            ],
          ),
        );
      },
    );
  }

}
