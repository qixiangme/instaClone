import 'package:flutter/material.dart';
import 'package:mvvmclone/pages_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BottomNavigationBar 아이템들 정의
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(
      icon: Icon(Icons.plus_one_rounded),
      label: 'Search',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Column(
          children: [
            Flexible(child: pages[currentIndex]),
            //페이지 추가T
          ],
        ),

        // 네비게이션 바 추가
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          items: items,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            currentIndex = value;

            setState(() {});
            print("object");
          },
        ),
      ),
    );
  }
}
