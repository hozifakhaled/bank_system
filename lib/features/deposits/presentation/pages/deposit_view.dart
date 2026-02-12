import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/features/deposits/presentation/manger/deposit_cubit/cubit/deposit_cubit.dart';
import 'package:bank_system/features/deposits/presentation/widgets/body_depoist_view.dart';
import 'package:bank_system/features/deposits/presentation/widgets/deposit_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositView extends StatefulWidget {
const  DepositView ({super.key});

  @override
  State<DepositView> createState() => _DepositViewState();
}

class _DepositViewState extends State<DepositView> {
 final List<Map<String, String>> deposits = [
    {'amount': '200', 'date': 'Jan 1, 2026', 'method': 'Current Account'},
    {'amount': '150', 'date': 'Jan 10, 2026', 'method': 'Card'},
  ];

  @override
  Widget build(BuildContext context) {
 return  BlocProvider.value(
                value:sl<DepositCubit>()..getBalance(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: maincolor,
          title: const Text(
            'Deposit',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BodyDepoistView(deposits: deposits),
      ),
    );
  }
}

