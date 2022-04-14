import 'package:flutter/material.dart';

class ListBanner extends StatelessWidget {
  final String image;

  ListBanner({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 10),
      height: 124,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
