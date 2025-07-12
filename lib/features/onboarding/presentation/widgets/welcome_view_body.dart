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

  List<Map<String, dynamic>> pages = [
    {
      'icon': Icons.security,
      'title': 'Secure Banking',
      'description':
          'Your money is protected with bank-level security and advanced encryption technology.',
    },
    {
      'icon': Icons.flash_on,
      'title': 'Fast Transactions',
      'description':
          'Transfer and receive money instantly with zero waiting time.',
    },
    {
      'icon': Icons.analytics,
      'title': 'Smart Analytics',
      'description':
          'Track your expenses and manage your finances effectively.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                animatePageChange(index);
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                     SizedBox(height: 20.h),
                      // Skip Button with bank icon
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: maincolor,
                              ),
                              child: Center(
                                child: Text(
                                  '🏦',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            currentIndex != pages.length - 1
                                ? TextButton(
                                  onPressed: () {
                                    pageController.jumpToPage(
                                      pages.length - 1,
                                    );
                                  },
                                  child: Text(
                                    "Skip",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Icon Circle with Slide & Fade Animation
                      SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 250.w,
                                width: 250.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: maincolor.withOpacity(0.2),
                                ),
                              ),
                              Container(
                                height: 150.w,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: maincolor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: maincolor.withOpacity(0.4),
                                      blurRadius: 20,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  pages[index]['icon'],
                                  color: Colors.white,
                                  size: 40.w,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // Title
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          pages[index]['title'],
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // Description
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          pages[index]['description'],
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      // Page Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pages.length,
                          (indicatorIndex) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            height: 7.h,
                            width: currentIndex == indicatorIndex ? 20.w : 10.w,
                            decoration: BoxDecoration(
                              color: currentIndex == indicatorIndex
                                  ? maincolor
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                          ),
                        ),
                      ),
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
                      GoRouter.of(context).push(Routes.signupasuser);
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
    );
  }
}
