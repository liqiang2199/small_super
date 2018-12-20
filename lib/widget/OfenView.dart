import 'package:flutter/material.dart';

/*
 * 界面重用 控件
 */
class OftenView{
  /*
   * 界面重用  padding
   */
  static Widget often10Padding(){
    return new Container(
      padding: const EdgeInsets.all(10.0),
    );
  }

  static Widget oftenPadding(double v){
    return new Container(
      padding: new EdgeInsets.all(v),
    );
  }

  static Widget oftenLeftPadding(double v){
    return new Container(
      padding: new EdgeInsets.only(left: v),
    );
  }

  static Widget oftenTopPadding(double v){
    return new Container(
      padding: new EdgeInsets.only(top:v,),
    );
  }
  /*
   * 界面重用  margin
   */
  static Widget oftenMargin(double v){
    return new Container(
      margin: new EdgeInsets.all(v),
    );
  }

  /*
   * 1dp 的直线
   */
  static Widget line_One(){
    return new Container(
      height: 1.0,
      color: Color(0xffF1F1F1),
    );
  }

  static Widget line(double d){
    return new Container(
      height: d,
      color: Color(0xffF1F1F1),
    );
  }

}