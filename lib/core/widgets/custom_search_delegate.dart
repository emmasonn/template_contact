import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({
    super.searchFieldStyle,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
              ))
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {

    return super.appBarTheme(context).copyWith(

    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Hero(
          tag: 'search',
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
        width: size.width,
        height: size.height,
        child: ListView(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Container(
     child: Text('$query')
    );
  }
}
