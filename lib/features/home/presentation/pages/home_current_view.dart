import 'package:bank_system/features/home/presentation/widgets/home_current_view_body.dart';
import 'package:flutter/material.dart';

class   HomeCurrentView extends StatelessWidget {
  const HomeCurrentView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomeCurrentViewBody(),
      ),
    );
  }
}