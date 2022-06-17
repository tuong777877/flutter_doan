import 'package:flutter/material.dart';
import 'package:flutter_doan/search/components/body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);
  static String routeName = "/SearchPage";
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}