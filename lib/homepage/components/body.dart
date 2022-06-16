import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doan/homepage/components/homeheader.dart';
import 'package:flutter_doan/homepage/homefragment/home_fragment.dart';
import 'package:flutter_doan/model/foods.dart';
import 'package:flutter_doan/style/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 20.0),),
              HomeHeader(),
              Column(
                children: [
                  SizedBox(
                  height: 200.0,
                  width: double.infinity,
                  child: Carousel(
                    images: imgList.map((item)=>Container(
                    child: Image.network(item,
                    fit: BoxFit.cover,
                    ),
                  )).toList(),
                  ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                    child: Text('Top bán chạy',
                    style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
                HomeDetail(),
                ],
              )
              
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
