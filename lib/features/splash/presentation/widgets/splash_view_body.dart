import 'package:bank_system/features/splash/presentation/widgets/main_section_splash_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _letterController;
  late AnimationController _circleController;
  late AnimationController _pulseController;

  List<Animation<double>> letterAnimations = [];
  late Animation<double> circleAnimation;
  late Animation<double> pulseAnimation;



  @override
  void initState() {
    super.initState();

    _letterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _circleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    for (int i = 0; i < 'BANKY'.length; i++) {
      double start = (i * 0.15).clamp(0.0, 1.0);
      double end = (start + 0.3).clamp(0.0, 1.0);

      letterAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _letterController,
            curve: Interval(start, end, curve: Curves.elasticOut),
          ),
        ),
      );
    }

    circleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeInOut),
    );

    pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    _circleController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _letterController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _letterController.dispose();
    _circleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainSection(circleController: _circleController, circleAnimation: circleAnimation, pulseController: _pulseController, pulseAnimation: pulseAnimation, letterAnimations: letterAnimations);
  }
}

