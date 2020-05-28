import 'package:flutter/material.dart';

class Style extends SizedBox {
  
  static var font = "Hiragino Sans";
   
  // タイトルのスタイル
  static var titleText = TextStyle(
    color: Color(0xffcf3e3e),
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    fontSize: 18.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  // 本文のスタイル
  static var text = TextStyle(
    color: Color(0xff000000),
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    fontSize: 14.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  // UserVoice名前のスタイル
  static var userVoiceNameText = TextStyle(
    color: Color(0xff338dcd),
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    fontSize: 20.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  // UserVoice本文のスタイル
  static var userVoiceText = TextStyle(
    color: Color(0xff338dcd),
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    fontSize: 16.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  // プラスボタン文字のスタイル
  static var plusButtonText = TextStyle(
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    fontSize: 40.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  // 返信ボタン文字のスタイル
  static var replyButtonText = TextStyle(
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    fontSize: 18.0,
    fontFamily: font,
    locale: Locale("ja", "JP"),
  );
  
  Style({double width = 8, double height = 8})
    : super(width: width, height: height);

  Style.width([double value = 8]) : super(width: value);
  Style.height([double value = 8]) : super(height: value);
}