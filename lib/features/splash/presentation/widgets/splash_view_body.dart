import 'package:bank_system/core/themeing/colors.dart';
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

  final String bankText = 'BANKY';

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

    for (int i = 0; i < bankText.length; i++) {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _circleController,
            builder: (context, child) {
              return Transform.scale(
                scale: circleAnimation.value,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: maincolor,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.account_balance,
                      size: 40,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: pulseAnimation.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    bankText.length,
                    (index) => AnimatedBuilder(
                      animation: letterAnimations[index],
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                            0,
                            50 * (1 - letterAnimations[index].value),
                          ),
                          child: Opacity(
                            opacity: letterAnimations[index].value.clamp(
                              0.0,
                              1.0,
                            ),
                            child: Text(
                              bankText[index],
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
