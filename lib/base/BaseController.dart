import 'package:flutter/material.dart';

abstract class BaseController extends StatefulWidget{

  /*
   * 创建标题
   */
  Widget toolBarAPPBar(String title,int lead){
    return new AppBar(
      title: new Text(title,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      //leading: lead == 0?null:new Icon(Icons.chevron_left,color: Color(0xff323232),size: 48.0,),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData.fallback(),
    );
  }

}