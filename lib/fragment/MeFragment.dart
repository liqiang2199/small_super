import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';

class MeFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MeFragment();
  }

}
class _MeFragment extends State<MeFragment>{
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
      title: new Text(ValueString.meTitle,
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