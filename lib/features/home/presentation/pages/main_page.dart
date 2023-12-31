import 'package:bund_investments/core/utils/app_colors.dart';
import 'package:bund_investments/features/home/presentation/pages/chat_page.dart';
import 'package:bund_investments/features/home/presentation/pages/home_page.dart';
import 'package:bund_investments/features/home/presentation/pages/investment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  final pages = [
    const HomePage(),
    const InvestmentPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedIconTheme: const IconThemeData(
          color: AppColor.primaryColor,
        ),
        selectedItemColor: AppColor.primaryColor,
        onTap: _onBottomNavigationClicked,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/investment.svg'),
            label: 'Investment',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/chat.svg'),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  void _onBottomNavigationClicked(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
