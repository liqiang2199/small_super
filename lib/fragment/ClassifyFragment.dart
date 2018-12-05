import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';
import 'package:small_super/value/string.dart';

class ClassifyFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ClassifyFragment();
  }

}
class _ClassifyFragment extends State<ClassifyFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: _toolBarAPPBar(),
      body: new Column(
        children: <Widget>[
          _searchClassify(),
        ],
      ),
    );
  }

  /*
   * 创建标题
   */
  Widget _toolBarAPPBar(){
    return new AppBar(
      title: new Text(ValueString.classifyTitle,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
      leading: null,
      backgroundColor: Colors.white,
    );
  }

  /*
   * 搜索框
   */
  Widget _searchClassify(){
    return new Center(
      child: new Row(
        children: <Widget>[
          //搜索
          new Container(
            child: new TextField(
              cursorColor: Colors.grey,
              cursorRadius: Radius.circular(10.0),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff222222)
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: ValueString.searchHintText,
                hintStyle: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 14.0,
                ),
              ),
            ),
            width: 240.0,
            height: 48.0,
          ),
          //
          new Text(ValueString.searchText,
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff222222)
            ),
          ),

        ],
      ),
    );
  }

}