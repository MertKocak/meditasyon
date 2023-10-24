import 'package:flutter/material.dart';
import 'package:meditasyon/constants.dart';
import 'package:meditasyon/view/AudioPage.dart';

Widget customListTile(
    {required String title,
    required String coverImg,
    required String info,
    required String owner,
    onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(coverImg), fit: BoxFit.cover)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 0,
                      fontFamily: "hankenM",
                      color: Constants.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  owner,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: "hankenB",
                      letterSpacing: 0,
                      color: Constants.purple),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
