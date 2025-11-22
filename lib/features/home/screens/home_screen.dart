import 'package:e_commerce/features/account/screens/account_screen_body.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/screen_body.dart';
import 'package:e_commerce/features/home/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var pages = [
    const HomeScreenBody(),
    const CartScreenBody(),
    const AccountScreenBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          if (currentIndex == 1) {
            // Refresh cart when navigating to cart screen
            context.read<CartCubit>().getUserCart();
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
