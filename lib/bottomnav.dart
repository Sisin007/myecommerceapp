import 'package:ecommerceapp/cart_screen.dart';
import 'package:ecommerceapp/home_screen.dart';
import 'package:ecommerceapp/profile.dart';
import 'package:ecommerceapp/wishlist_screen.dart';
import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    Profile(),
    
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          children: [
            BottomNavItems(
              icons: Icons.house_outlined,
              filledIcon: Icons.home_filled,
              label: 'Home',
              onTap: () {
                changeIndex(0);
              },
              isActive: currentIndex == 0,
            ),
            Spacer(),
            BottomNavItems(
              icons: Icons.favorite_outline,
              filledIcon: Icons.favorite,
              label: 'Favorite',
              onTap: () {
                changeIndex(1);
              },
              isActive: currentIndex == 1,
            ),
            Spacer(),
            BottomNavItems(
              icons: Icons.shopping_bag_outlined,
              filledIcon:Icons.shopping_bag,
              label: 'Cart',
              onTap: () {
                changeIndex(2);
              },
              isActive: currentIndex == 2,
            ),
            Spacer(),
            BottomNavItems(
              icons: Icons.person_outline,
              filledIcon: Icons.person,
              label: 'Profile',
              onTap: () {
                changeIndex(3);
              },
              isActive: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}


class BottomNavItems extends StatelessWidget {
  final IconData icons;
  final IconData filledIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavItems({
    super.key,
    required this.icons,
    required this.label,
    required this.onTap,
    required this.isActive,
    required this.filledIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            isActive ? filledIcon : icons,
            color: isActive ? Colors.orange : Colors.grey[500],
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: isActive ? 16 : 15,
              color: isActive ? Colors.orange : Colors.grey[500],
              fontWeight: isActive ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}