import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';

class ShoppingFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingFragment();
  }

}
class _ShoppingFragment extends State<ShoppingFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[

          _toolBarAPPBar(),

        ],
      ),
    );
  }

  /*
   * 创建标题
   */
  Widget _toolBarAPPBar(){
    return new AppBar(
      title: new Text(ValueString.shoppingTitle,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      leading: null,
      backgroundColor: Colors.white,
    );
  }

}