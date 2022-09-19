import 'package:flutter/material.dart';

const faceBookColor = Color(0xFF4062B9);
const activeColor = Color(0xFF1B304D);
const inActiveColor = Color(0XFF8D97A6);
const bottomBarInactive = Color(0xFF828282);
const errColor = Color(0XFFE33806);
const dividerColor = Color(0xFF828282);
const titleColor = Color(0xFF1B304D);
const contentColor = Color(0xFF1B304D);
const redColor = Color(0xFFE33806);
const yellowColor = Color(0xFFF2C94C);
const backgroundColor = Color(0xFFF7F8F9);
const greyColor = Color(0xFFBDBDBD);
const grey6Color = Color(0xFFF2F2F2);
const grey5Color = Color(0xFFE0E0E0);
const grey3Color = Color(0xFF828282);
const blue3Color = Color(0xFF56CCF2);
const grey4Color = Color(0xFFBDBDBD);
const blue1Color = Color(0xFF2F80ED);
const appPadding = 16.0;
const appRadius = 4.0;

const lineHeight = 1.5;
const w100 = FontWeight.w100;
const w200 = FontWeight.w200;
const w300 = FontWeight.w300;
const w400 = FontWeight.w400;
const w500 = FontWeight.w500;
const w600 = FontWeight.w600;
const w700 = FontWeight.w700;
const w800 = FontWeight.w800;
const w900 = FontWeight.w900;
const divider = Divider(
  height: 1,
  color: greyColor,
);
const customDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(appRadius),
  ),
  boxShadow: [
    BoxShadow(
      color: Color(0xFFF2F2F2),
      spreadRadius: 1,
      blurRadius: 2,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
);

const size16w700 = TextStyle(
  fontSize: 16.0,
  height: lineHeight,
  fontWeight: w700,
);
const size14w700 = TextStyle(
  fontSize: 14.0,
  height: lineHeight,
  fontWeight: w700,
);
const size14w500 = TextStyle(
  fontSize: 14.0,
  height: lineHeight,
  fontWeight: w500,
);
const size48W900Red = TextStyle(
  fontSize: 48.0,
  fontWeight: w900,
  color: Colors.red,
);
const size48W900Blue = TextStyle(
  fontSize: 48.0,
  fontWeight: w900,
  color: Colors.blue,
);
const size48W900Yellow = TextStyle(
  fontSize: 48.0,
  fontWeight: w900,
  color: Colors.yellow,
);
