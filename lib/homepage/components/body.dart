import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doan/homepage/components/homeheader.dart';
import 'package:flutter_doan/homepage/homefragment/dicorvery_home.dart';
import 'package:flutter_doan/homepage/homefragment/home_fragment.dart';
import 'package:flutter_doan/homepage/homepage.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            Discovery(),
            HomeDetail(),
          ],
        ),
      ),
    );
  }
}

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   var selectIndex = 0;
//   var flag = true;

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> screen = [
//       HomeDetail(),
//       const TableListFragmet(),
//       const FoodHomeFragment(),
//       //const categoryfood2(),
//       //const PreferentialFragment(),
//       const DifferentFragment()
//     ];

//     return Scaffold(
//       // appBar: AppBar(
//       //   elevation: 0,
//       //   backgroundColor: Colors.transparent,
//       //   title: flag ? const HomeHeader() : const FoodHeader(),
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectIndex,
//         onTap: (index) {
//           Colors.blue;
//           setState(() {
//             selectIndex = index;
//             if (selectIndex != 2) {
//               flag = true;
//             } else {
//               flag = false;
//             }
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Trang chủ',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Đặt bàn',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Thức ăn',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Khuyến mãi',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Khác',
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             screen[selectIndex]
//           ],
//         ),
//       ),
//     );
//   }
// }
