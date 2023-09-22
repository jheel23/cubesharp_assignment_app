import 'package:cubesharp_assignment_app/widgets/categories_widget.dart';
import 'package:cubesharp_assignment_app/widgets/custom_first_stack_widget.dart';
import 'package:cubesharp_assignment_app/widgets/top_picks_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: SizedBox(
            height: 50,
            width: 70,
            child: Image.asset('assets/images/dummylogoCubesharp.png')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.search,
              color: Color(0xffe55a44),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CustomStackWidget(deviceSize: deviceSize),
          const CategoriesWidget(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(0, 5),
                  )
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: const TopPicksWidget(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xffe55a44),
        shape: const CircleBorder(),
        child: const Icon(Ionicons.cart_outline, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //!We can later make these IconButton's navigate to their respective screens.
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Color(0xffe55a44),
                    )),
                const Text('Home',
                    style: TextStyle(
                        color: Color(0xffe55a44),
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )),
                const Text('Wishlist',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.assignment_outlined,
                      color: Colors.grey,
                    )),
                const Text('Orders',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
                const Text('Profile',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }
}
