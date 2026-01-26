import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class MainSection extends StatelessWidget {
  const MainSection({
    super.key,
    required AnimationController circleController,
    required this.circleAnimation,
    required AnimationController pulseController,
    required this.pulseAnimation,

    required this.letterAnimations,
  }) : _circleController = circleController, _pulseController = pulseController;

  final AnimationController _circleController;
  final Animation<double> circleAnimation;
  final AnimationController _pulseController;
  final Animation<double> pulseAnimation;

  final List<Animation<double>> letterAnimations;

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
                    'BANKY'.length,
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
                              'BANKY'[index],
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
