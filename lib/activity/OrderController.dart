import 'package:flutter/material.dart';
import 'package:small_super/base/BaseController.dart';
import 'package:small_super/widget/OfenView.dart';

/*
 * 我的订单
 */
class OrderController extends BaseController {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrderController(toolBarAPPBar("我的订单", 1));
  }

}

class _OrderController extends State<OrderController> with SingleTickerProviderStateMixin{
  Widget barW;
  var orderTabList = ["已完成","预约中"];

  TabController _tabController;

  _OrderController(Widget w){
    this.barW = w;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: orderTabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: barW,
      body: new Column(
        children: <Widget>[

          _tabBarAndScreen(),
          new Expanded(child: _orderContentList(),),

        ],
      ),
    );
  }

  /*
   * 订单类型 和 筛选
   */

  Widget _tabBarAndScreen(){
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      height: 48.0,
      child: new Row(
        children: <Widget>[

          new Expanded(child: _orderTabBar(),),

          new Text(
            "筛选",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xff222222),
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),

        ],
      ),
    );
  }

  Widget _orderTabBar(){
    return new TabBar(
      isScrollable: true,
      tabs: _tabTitleList(),
      indicatorColor: Color(0xffF6B13E),
      labelColor: Color(0xffF6B13E),
      unselectedLabelColor: Color(0xff222222),
      controller: _tabController,
    );
  }
  List<Widget> _tabTitleList(){
    List<Widget> titleList = List();
    for (int i = 0;i<orderTabList.length;i++){
      titleList.add(new Text(
        orderTabList[i],
        style: TextStyle(
          fontSize: 16.0,
          color: Color(0xff222222),
        ),
      ));
    }
    return titleList;
  }

  /*
   * 订单列表
   */
  Widget _orderContentList(){
    return new ListView(
      children: <Widget>[
        _orderList(),
      ],
    );
  }

  Widget _orderList(){
    return new Column(
      children: <Widget>[

        //订单编号和日期
        new Container(
          padding: EdgeInsets.only(right: 10.0,left: 10.0,top: 10.0,),
          height: 50.0,
          child: new Row(
            children: <Widget>[
              new Expanded(child: new Text("订单编号：20181220133800",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff222222),
                ),
              ),),

              new Text("2018-12-20",
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff222222),
                ),
              ),

            ],
          ),
        ),
        //_orderListContent(),
        new Container(
          height: 475.0,
          child: new ListView(
            physics: new NeverScrollableScrollPhysics(),
            children: _listViewOrder(),
          ),
        ),

      ],
    );
  }

  List<Widget> _listViewOrder(){
    List<Widget> _listOrder = List();
    for (int i = 0;i < 3;i++){
      _listOrder.add(_orderListContent());
    }
    return _listOrder;
  }
  //具体商品
  Widget _orderListContent(){
    return new Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,),
      color: Colors.white,
      height: 135.0,
      child: new Row(
        children: <Widget>[

          new Image.asset("images/icon_shop.jpg",
            width: 75.0,
            height: 75.0,
          ),

          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Row(
                children: <Widget>[
                  //遗恨失吞吴。
                  new Text("功盖三分国，名成八阵图。江流石不转，",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 14.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                  ),

//                  new Container(
//                    width: 25.0,
//                    child:new Text("x1",
//                      style: TextStyle(
//                        color: Color(0xff888888),
//                        fontSize: 14.0,
//                      ),
//                    ),
//                  ),

                ],
              ),
              OftenView.oftenTopPadding(10.0),
              new Text("300 首",
                style: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 14.0,
                ),
              ),
              OftenView.oftenTopPadding(10.0),
              new Row(
                children: <Widget>[
                  new Container(
                    width: 240.0,
                    child: new Row(
                      children: <Widget>[
                        new Image.asset("images/icon_sell_loction.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        new Text("涪城区滨江路55号",
                          style: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  new Text("￥59.90",
                    style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 18.0,
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

}