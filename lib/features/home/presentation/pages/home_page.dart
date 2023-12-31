import 'package:bund_investments/core/network/carousel_response.dart';
import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:bund_investments/features/home/presentation/widgets/home_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final items = [
    const CarouselItem('id', 'First', 'NBE',
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*5BdBcKfvLtgPSHjSuGs5KA.png'),
    const CarouselItem('id', 'Second', 'Egypt',
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*5BdBcKfvLtgPSHjSuGs5KA.png'),
    const CarouselItem('id', 'Third', 'CIB',
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*5BdBcKfvLtgPSHjSuGs5KA.png'),
    const CarouselItem('id', 'Forth', 'HSBC',
        'https://miro.medium.com/v2/resize:fit:1400/format:webp/1*5BdBcKfvLtgPSHjSuGs5KA.png'),
  ];
  late AnimationController _profileController;
  late AnimationController _notificationController;
  late Animation<double> _profileAnimation;
  late Animation<double> _notificationAnimation;

  @override
  void initState() {
    _profileController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _notificationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _profileAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(
            begin: 0,
            end: 1.2,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.2,
            end: 0,
          ),
          weight: 1),
    ]).animate(_profileController);

    _profileController.addListener(() {
      if (_profileController.value == 1) {
        _profileController.stop();
      }
    });

    _notificationAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(
            begin: 0.0,
            end: 10.0,
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(
            begin: 10.0,
            end: 0.0,
          ),
          weight: 1),
    ]).animate(_notificationController);

    _notificationController.addListener(() {
      if (_notificationController.value == 1) {
        _notificationController.stop();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColor.backgroundColor,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: _onProfileClicked,
                  child: AnimatedBuilder(
                    animation: _profileAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.0 + 0.2 * _profileAnimation.value,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/user.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: _onProfileClicked,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Color(0xFF495678),
                          ),
                        ),
                        Text('Mahmoud Magdy',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColor.primaryColor,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: _openNotifications,
                  child: AnimatedBuilder(
                    animation: _notificationAnimation,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(0.0, -_notificationAnimation.value),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'assets/notification.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            HomeCarousel(items: items),
            const Text(
              'Conditions',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/min_deposit.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'No Minimum Deposit',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/bank.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '\$15/Month (Paid Annually)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'What You Get',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/bank.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Swiss Bank Account',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/debit_card.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Mastercard Prepaid',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/flash.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Account Open Same Day',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/umbrella.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Protected up to \$100,000',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/grow.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Investments Portfolios',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/lunch.svg'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Deposits Options',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA4ABBB),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openNotifications() {
    if (!_notificationController.isAnimating) {
      _notificationController.reset();
      _notificationController.forward();
    }
  }

  void _onProfileClicked() {
    if (!_profileController.isAnimating) {
      _profileController.reset();
      _profileController.forward();
    }
  }

  @override
  void dispose() {
    _notificationController.dispose();
    _profileController.dispose();
    super.dispose();
  }
}
