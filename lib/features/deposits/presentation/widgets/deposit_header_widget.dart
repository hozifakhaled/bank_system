import 'package:bank_system/features/deposits/presentation/manger/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const maincolor = Color(0xFF6366F1);

class DepositHeaderWidget extends StatelessWidget {

  const DepositHeaderWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositCubit, DepositState>(
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
              )  : state is DepositLoading ? const Center(
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
