import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child:  Center(
          child: Text('Search Page',style: Theme.of(context).textTheme.titleLarge,),
        ),
      ),
    );
  }
}
