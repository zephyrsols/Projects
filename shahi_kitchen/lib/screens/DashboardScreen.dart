import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shahi_kitchen/screens/BurgerScreen.dart';
import 'package:shahi_kitchen/screens/CartScreen.dart';
import 'package:shahi_kitchen/screens/DealsScreen.dart';
import 'package:shahi_kitchen/screens/ExtraFoodScreen.dart';
import 'package:shahi_kitchen/screens/HomeScreen.dart';
import 'package:shahi_kitchen/screens/PizzaScreen.dart';
import 'package:shahi_kitchen/screens/ProfileScreen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  double homeHeight = 40;
  double cartHeight = 30;
  double userHeight = 30;

  String homeSvg = "assets/svg/home_red.svg";
  String cartSvg = "assets/svg/cart_black.svg";
  String userSvg = "assets/svg/user_black.svg";


  int index = 0;

  List navigationScreens = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationScreens[index],
          Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(22),
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(52),
                      bottomRight: Radius.circular(52)),
                  color: Colors.black.withOpacity(0.7)),
              child: Row(

                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index = 0;
                        homeHeight = 40;
                        cartHeight = 30;
                        userHeight = 30;
                        homeSvg = "assets/svg/home_red.svg";
                        cartSvg = "assets/svg/cart_black.svg";
                        userSvg = "assets/svg/user_black.svg";
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: homeHeight,
                      child: SvgPicture.asset(homeSvg,height: homeHeight,),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index = 1;
                        homeHeight = 30;
                        cartHeight = 40;
                        userHeight = 30;
                        homeSvg = "assets/svg/home_black.svg";
                        cartSvg = "assets/svg/cart_red.svg";
                        userSvg = "assets/svg/user_black.svg";
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: cartHeight,
                      child: SvgPicture.asset(cartSvg,height: cartHeight,),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        index = 2;
                        homeHeight = 30;
                        cartHeight = 30;
                        userHeight = 40;
                        homeSvg = "assets/svg/home_black.svg";
                        cartSvg = "assets/svg/cart_black.svg";
                        userSvg = "assets/svg/user_red.svg";

                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: userHeight,
                      child: SvgPicture.asset(userSvg,height: userHeight,),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
