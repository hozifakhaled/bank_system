import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({super.key});

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody>
    with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  int currentIndex = 0;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  List<Map<String, dynamic>> pages = [
    {
      'icon': Icons.security_rounded,
      'title': 'Secure Banking',
      'description':
          'Your money is protected with bank-level security and advanced encryption technology.',
      'gradient': [Color(0xFF667eea), Color(0xFF764ba2)],
    },
    {
      'icon': Icons.flash_on_rounded,
      'title': 'Fast Transactions',
      'description':
          'Transfer and receive money instantly with zero waiting time.',
      'gradient': [Color(0xFFf093fb), Color(0xFFf5576c)],
    },
    {
      'icon': Icons.analytics_rounded,
      'title': 'Smart Analytics',
      'description':
          'Track your expenses and manage your finances effectively.',
      'gradient': [Color(0xFF4facfe), Color(0xFF00f2fe)],
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void animatePageChange(int index) {
    _animationController.reset();
    setState(() {
      currentIndex = index;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              maincolor.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Decorative circles in background
              Positioned(
                top: -100.h,
                right: -100.w,
                child: Container(
                  height: 300.w,
                  width: 300.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        maincolor.withOpacity(0.1),
                        maincolor.withOpacity(0.05),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -150.h,
                left: -150.w,
                child: Container(
                  height: 350.w,
                  width: 350.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        maincolor.withOpacity(0.08),
                        maincolor.withOpacity(0.03),
                      ],
                    ),
                  ),
                ),
              ),

              // Main content
              PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  animatePageChange(index);
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        // Top bar with bank icon and skip button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                gradient: LinearGradient(
                                  colors: [
                                    maincolor,
                                    maincolor.withOpacity(0.8),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: maincolor.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '🏦',
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                              ),
                            ),
                            if (currentIndex != pages.length - 1)
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    pageController.jumpToPage(pages.length - 1);
                                  },
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 10.h,
                                    ),
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),

                        Spacer(flex: 1),

                        // Animated icon with gradient background
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              height: 280.w,
                              width: 280.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: pages[index]['gradient'],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: pages[index]['gradient'][0]
                                        .withOpacity(0.4),
                                    blurRadius: 40,
                                    spreadRadius: 5,
                                    offset: Offset(0, 15),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  height: 200.w,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: Icon(
                                    pages[index]['icon'],
                                    color: Colors.white,
                                    size: 80.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Spacer(flex: 1),

                        // Title with animation
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Text(
                              pages[index]['title'],
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[900],
                                letterSpacing: -0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Description with animation
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                pages[index]['description'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[600],
                                  height: 1.6,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),

                        Spacer(flex: 1),

                        // Enhanced page indicators
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (indicatorIndex) => AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 8.h,
                              width: currentIndex == indicatorIndex ? 32.w : 8.w,
                              decoration: BoxDecoration(
                                gradient: currentIndex == indicatorIndex
                                    ? LinearGradient(
                                        colors: pages[indicatorIndex]['gradient'],
                                      )
                                    : null,
                                color: currentIndex == indicatorIndex
                                    ? null
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.r),
                                boxShadow: currentIndex == indicatorIndex
                                    ? [
                                        BoxShadow(
                                          color: pages[indicatorIndex]
                                                  ['gradient'][0]
                                              .withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 50.h),
                      ],
                    ),
                  );
                },
              ),

            // Bottom Next button
            Positioned(
              bottom: 30.h,
              left: 20.w,
              right: 20.w,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: maincolor,
                  ),
                  onPressed: () {
                    if (currentIndex < pages.length - 1) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      GoRouter.of(context).push(Routes.accountOverview);
                  //    GoRouter.of(context).push(Routes.choiceuser);
                    }
                  },

                  child: Text(
                    currentIndex == pages.length - 1 ? "Start" : "Next",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}