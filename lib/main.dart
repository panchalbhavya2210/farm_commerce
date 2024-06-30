import 'package:farm_commerce/cart.dart';
import 'package:farm_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:farm_commerce/explore.dart';
import 'package:farm_commerce/home.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color rgbo = const Color.fromRGBO(0, 126, 47, 1);
  int currentIndx = 0;
  final PageController _pageController = PageController();

  final List<Widget> _children = const [
    HomePage(),
    ExplorePage(),
    CartPage(),
    ProfilePage()
  ];

  Color background = const Color.fromRGBO(223, 241, 230, 1);

  void _onTabTapped(int index) {
    setState(() {
      currentIndx = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
          useMaterial3: true,
          fontFamily: 'Poppins'),
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          toolbarHeight: 80,
          title: Text(
            _getTitle(currentIndx),
            key: ValueKey<int>(currentIndx),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: rgbo,
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () => {},
                icon: SvgPicture.asset("icons/notification.svg"),
                splashColor: rgbo,
                splashRadius: 40,
                iconSize: 35,
              ),
            )
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndx = index;
            });
          },
          children: _children,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50 / 2),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                      blurRadius: 5)
                ]),
            child: BottomNavigationBar(
              currentIndex: currentIndx,
              iconSize: 30,
              onTap: _onTabTapped,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('icons/home_outlined.svg'),
                    tooltip: "Home",
                    label: "Home",
                    activeIcon: SvgPicture.asset('icons/home.svg')),
                BottomNavigationBarItem(
                    tooltip: "Explore ",
                    icon: SvgPicture.asset('icons/explore_outlined.svg'),
                    label: "Explore",
                    activeIcon: SvgPicture.asset('icons/explore.svg')),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('icons/cart.svg'),
                    label: "Cart",
                    activeIcon: SvgPicture.asset('icons/cart_filled.svg')),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('icons/profile.svg'),
                    label: "Profile",
                    activeIcon: SvgPicture.asset('icons/profile_filled.svg')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return "Farmers";
      case 1:
        return "Explore";
      case 2:
        return "Cart";
      case 3:
        return "Profile";
      default:
        return "Farmers";
    }
  }
}
