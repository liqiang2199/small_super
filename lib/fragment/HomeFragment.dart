import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeFragment();
  }
}
class _HomeFragment extends State<HomeFragment>{

  static BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _buildContext = context;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: _toolBarAPPBar(),
      body: new ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[

          _bannerImageList(),
          new Container(
            margin: const EdgeInsets.only(top: 10.0,),
          ),
          _buttonSection,
          new Container(
            margin: const EdgeInsets.only(bottom: 10.0,),
          ),
          //灰色线条
          new Container(
            height: 10.0,
            color: Colors.white70,
          ),

          _shopLocal(),
          //_shop(),
          OftenView.oftenTopPadding(20.0),
          new Container(
            height: 900.0,
            child: _shopGrid(),
          ),
          //new Expanded(child: _shopGrid(),flex: 1,)

        ],
      ),
    );
  }


  /*
   * 创建标题
   */
  Widget _toolBarAPPBar(){
    return new AppBar(
      title: const Text(ValueString.homeTitle,
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
   * 创建 banner
   */
  Widget _bannerImageList(){
    return new Image.asset("images/icon_background.jpg",
      width: 375.0,
      height: 180.0,
      fit: BoxFit.fill,
    );
  }
  /*
   * 活动列表
   */
  var _buttonSection = new Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        new Expanded(child: buttonColumn("images/icon_discount.png", ValueString.publicWelfareDonationTitle),flex: 1,),
        new Expanded(child: buttonColumn("images/icon_processdonation.png", ValueString.preferentialActivitiesTitle),flex: 1,),
        new Expanded(
          child:new GestureDetector(
            onTap: (){
              Navigator.pushNamed(_buildContext, "vendingController");
            },
            child:  buttonColumn("images/icon_nearbymachine.png",
                ValueString.nearbyMachineTitle
            ),
          ),
          flex: 1,
        ),
        new Expanded(child: buttonColumn("images/icon_more.png", ValueString.moreTitle),flex: 1,),

      ],
    ),
  );

  static Column buttonColumn(String icon,String label){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //new Icon(icon),
        new Image.asset(icon,
          width: 60.0,
          height: 60.0,
          //fit: BoxFit.contain,
        ),
        new Container(
          margin: const EdgeInsets.only(top: 8.0,bottom: 8.0,),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 14.0,
              color: Color(0xff2F2F2F),
            ),
          ),
        ),
      ],
    );
  }
  /*
   * 商品列表 展示位置
   */
  Widget _shopLocal(){
    return new Row(
      children: <Widget>[
        OftenView.often10Padding(),
        new Expanded(child: new Row(
          children: <Widget>[

            new Image.asset("images/icon_sell_loction.png",width: 25.0,height: 25.0,),
            OftenView.oftenMargin(3.0),
            new Container(
              width: 200.0,
              child: new Text("安州区界牌镇一路五侧安州区界牌镇一路五侧",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff222222),
                ),
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
              ),
            ),
            OftenView.oftenMargin(3.0),
            new Text("距离100米",
              maxLines: 1,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xff222222),
              ),
              textAlign: TextAlign.center,
            ),

          ],
        ),

          flex: 1,),

        new Text("更多",
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xff888888),
          ),
          textAlign: TextAlign.center,
        ),
        new Icon(Icons.chevron_right),

      ],
    );
  }

  /*
   * 商品列表
   */
  Widget _shopGrid(){
    return new GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      physics: new NeverScrollableScrollPhysics(),
      primary: false,
      children: _shopGridLists(),
    );
  }

  List<Widget> _shopGridLists(){
    List<Widget> shops = new List();
    for(int i = 0;i<7;i++){
      shops.add(_shops());
    }
    return shops;
  }
  Widget _shops(){
    return new Container(
      child: new Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(new Radius.circular(8.0)),
        child: _shop(),
      ),
    );
  }

//  Widget _shops(){
//    return new Container(
//      color: Colors.blue,
//      height: 300.0,
//      child: new Text("ddd",style: TextStyle(color: Colors.red),),
//    );
//  }

  /*
   * 商品展示
   */
  Widget _shop(){
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          new Expanded(child: new Container(
            margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 0.0,bottom: 0.0),
            child: new Column(
              children: <Widget>[
                new Image.asset("images/icon_shop.jpg",
                  width: 40.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                new Text("冰冻猪肉五公斤散装,特别好吃无敌，超高校级...",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 14,
                    color: Color(0xff222222),
                  ),
                ),
              ],
            ),
          ),),
          new Container(
            margin: EdgeInsets.only(left: 5.0,right: 5.0,),
            height: 56.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("￥124.00",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff222222),
                  ),
                ),
                new Center(
                  child: new Row(
                    children: <Widget>[
                      new MaterialButton(
                        onPressed: (){
                          print("RaisedButton  -- ");
                        },
                        highlightColor: Color(0xffffffff),
                        splashColor: Color(0xffffffff),
                        color: Color(0xffffffff),
                        disabledElevation: 0.0,
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        minWidth: 30.0,
                        child: new Image.asset("images/icon_shop_minus.png",width: 25.0,height: 25.0,),
                      ),

                      new Text("99",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff222222),
                        ),
                      ),

                      new MaterialButton(
                        onPressed: (){
                          print("RaisedButton  ++ ");
                        },
                        highlightColor: Color(0xffffffff),
                        splashColor: Color(0xffffffff),
                        color: Color(0xffffffff),
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        minWidth: 30.0,
                        child: new Image.asset("images/icon_shop_add.png",width: 25.0,height: 25.0,),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}