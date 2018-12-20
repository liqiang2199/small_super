import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';

class MeFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MeFragment();
  }

}
class _MeFragment extends State<MeFragment>{

  var _funcName = ["我的订单","意见反馈","客服电话"];
  var _funcImages = ["images/icon_me_order.png","images/icon_suggestion.png","images/icon_customer.png"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: _toolBarAPPBar(),
      body: new Column(
        children: <Widget>[

          _headerImage_Name(),
          new Column(
            children: _functionListMe(),
          ),

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

  /*
   * 头像和用户名 控件
   */
  Widget _headerImage_Name(){
    return new Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      height: 185.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(20.0),
            child: new CircleAvatar(
              backgroundImage: new ExactAssetImage("images/icon_background.jpg"),
            ),
            width: 160.0,
            height: 160.0,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              new Text("Edit Profile",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xff222222)
                ),
              ),
              OftenView.oftenTopPadding(20.0),
              new Row(
                children: <Widget>[
                  new Image.asset("images/icon_integral.png",
                    width: 25.0,
                    height: 30.0,
                  ),
                  OftenView.oftenLeftPadding(5.0),
                  new Text("565685",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff222222)
                    ),
                  ),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }

  /*
   * 功能列表
   */
  List<Widget> _functionListMe(){
    List<Widget> meFuncList = List();
    for(int i = 0;i<_funcImages.length;i++){
      meFuncList.add(_meFunction(_funcImages[i],_funcName[i]));
    }
    return meFuncList;
  }

  /*
   * 我的 订单 客服 建议
   */
  Widget _meFunction(String imagePath,String funcName){
    return new GestureDetector(
      onTap: (){
        print(" 点击$funcName ");
        switch(funcName){
          case "我的订单":
            Navigator.pushNamed(context, "meOrder");
            break;
        }
      },
      child: new Container(
        margin: EdgeInsets.only(top: 10.0,),
        padding: EdgeInsets.only(left: 10.0,right: 10.0,),
        color: Colors.white,
        height: 58.0,
        child: new Row(
          children: <Widget>[

            new Expanded(child: new Row(
              children: <Widget>[
                new Image.asset(imagePath,
                  width: 25.0,
                  height: 30.0,
                ),
                OftenView.oftenLeftPadding(10.0),
                new Text(funcName,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff222222)
                  ),
                ),
              ],
            ),),

            new Icon(Icons.chevron_right),

          ],
        ),
      ),
    );
  }

}