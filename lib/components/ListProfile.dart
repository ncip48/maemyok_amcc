import 'package:flutter/material.dart';
import 'package:maemyok_amcc/constant/constant.dart';

class ListProfile extends StatelessWidget {
  final String label;
  final Widget icon;
  final Function()? action;

  ListProfile({
    required this.label,
    required this.icon,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      // height: 260,
      // width: 190,
      child: Stack(
        children: [
          InkWell(
            onTap: action,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: merah,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                ),
                SizedBox(width: 15),
                Text(label),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
