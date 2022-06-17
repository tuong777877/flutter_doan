import 'package:flutter/material.dart';
import 'package:flutter_doan/search/searchpage.dart';
import 'package:flutter_doan/style/constants.dart';
import 'package:flutter_doan/style/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () => {
          Navigator.pushNamed(context, SearchPage.routeName)
        },
        child: Row(
          children: const [
            Icon(Icons.search),
            Text("Tìm kiếm sản phẩm")
          ],
        )
      ),
    );
  }
}
