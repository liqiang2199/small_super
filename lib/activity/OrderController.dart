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
  PageController _pageController;
  int _pageIndex = 0;
  var isPageCanChange = true;

  _OrderController(Widget w){
    this.barW = w;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: orderTabList.length, vsync: this);

    _pageController = PageController(initialPage:_pageIndex, );

    _tabController.addListener((){
      if(_tabController.indexIsChanging){
        onPageChangeTab(_tabController.index,p:_pageController);
      }
    });
  }

  /*
   * 监听滑动
   */
  onPageChangeTab(int index,{PageController p,TabController t}) async{
    if (p == null){
      _tabController.animateTo(index);
    }else{
      isPageCanChange = false;
      await _pageController.animateToPage(index, duration: new Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChange = true;
    }
    setState(() {
        _pageIndex = index;
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          new Expanded(child: _pageOrderList(),),

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

  Widget _pageOrderList(){
    return new PageView(
      children: <Widget>[
        _orderContentList(),
        _orderContentList(),
      ],
      controller: _pageController,
      onPageChanged: (index){

        if (isPageCanChange){
          print("  _pageIndex  $index  ");

          onPageChangeTab(index);
        }
      },
    );
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

          _orderIsFinishHaveIsBooking(),

        ],
      ),
    );
  }

  /*
   * 通过下边返回不同的界面显示更新
   */
  Widget _orderIsFinishHaveIsBooking(){
    if(_pageIndex == 0){
      return _orderFinish();
    }
    return _orderBooking();
  }

  /*
   * 已完成订单
   */
  Widget _orderFinish(){
    return new Expanded(child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        new Row(
          children: <Widget>[
            //遗恨失吞吴。
            new Expanded(child: new Text("功盖三分国，名成八阵图。江流石不转,遗恨失吞吴。",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 14.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),),

            new Text("x1",
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 14.0,
              ),
            ),
            OftenView.oftenRightPadding(10.0),
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
            new Expanded(child: new Row(
              children: <Widget>[
                new Image.asset("images/icon_sell_loction.png",
                  width: 25.0,
                  height: 25.0,
                ),
                OftenView.oftenLeftPadding(5.0),
                new Text("涪城区滨江路55号",
                  style: TextStyle(
                    color: Color(0xff888888),
                    fontSize: 14.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),),

            new Text("￥59.90",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 18.0,
              ),
            ),
            OftenView.oftenRightPadding(10.0),

          ],
        ),

      ],
    ),);
  }

  /*
   * 预约中
   */
  Widget _orderBooking(){
    return new Expanded(child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        new Row(
          children: <Widget>[
            //商品内容
            new Expanded(child: new Text("海内存知己，天涯若比邻。无为在歧路，儿女共沾巾。",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 14.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),),
            //商品数量
            new Text("x1",
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 14.0,
              ),
            ),
            OftenView.oftenRightPadding(10.0),
          ],
        ),

        OftenView.oftenTopPadding(10.0),
        //商品规格
        new Text("300 首",
          style: TextStyle(
            color: Color(0xff888888),
            fontSize: 14.0,
          ),
        ),
        OftenView.oftenTopPadding(10.0),
        //地址
        new Row(
          children: <Widget>[
            new Expanded(child: new Text("￥59.90",
              style: TextStyle(
                color: Color(0xff222222),
                fontSize: 18.0,
              ),
            ),),
            //商品价格
//            new RaisedButton(
//                onPressed: (){},
//              child: new Text("申请退款",
//                style: TextStyle(
//                  fontSize: 14.0,
//                  color: Color(0xff888888)
//                ),
//              ),
//              color: Color(0xffffffff),
//              disabledColor: Color(0xffffffff),
//              splashColor: Color(0xffffffff),
//              highlightColor: Color(0xffffffff),
//            ),
            _onClickText("申请退款",0xff888888,(){
              print("申请退款");
            }),
            OftenView.oftenRightPadding(15.0),
//            new RaisedButton(
//              onPressed: (){},
//              child: new Text("查看取货码",
//                style: TextStyle(
//                    fontSize: 14.0,
//                    color: Color(0xff1888E6)
//                ),
//              ),
//            ),
            _onClickText("查看取货码",0xff1888E6,(){
              print("查看取货码");
            }),
            OftenView.oftenRightPadding(10.0),

          ],
        ),

      ],
    ),);
  }

  Widget _onClickText(String title,int vColor,action){
    return new GestureDetector(
      child: new Text("查看取货码",
        style: TextStyle(
            fontSize: 14.0,
            color: Color(vColor)
        ),
      ),
      onTap: () {
        action();
      },
    );
  }

}