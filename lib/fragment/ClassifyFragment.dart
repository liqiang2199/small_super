import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';
import 'package:small_super/value/string.dart';

class ClassifyFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ClassifyFragment();
  }

}
class _ClassifyFragment extends State<ClassifyFragment> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<String> _tabList;
  int tabIndex = 0;
  int currentTabIndex = 0;
  PageController _mPageController = PageController(initialPage: 0);
  var isPageCanChange = true;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _initTabList();
    _tabController = new TabController(vsync: this,
        length: _tabList.length,
      initialIndex: tabIndex,
    );
    /*
     * I/flutter ( 4264): _tabController index  0
        I/flutter ( 4264): ##_tabController previousIndex  2
        I/flutter ( 4264): PageView onPageChanged   1
        I/flutter ( 4264): _tabController index  1
        I/flutter ( 4264): ##_tabController previousIndex  0
        I/flutter ( 4264): _tabController index  1
        I/flutter ( 4264): ##_tabController previousIndex  0
        I/flutter ( 4264): _tabController index  1
        I/flutter ( 4264): ##_tabController previousIndex  0
     */
    //TabBar的监听
    _tabController.addListener((){
      print("_tabController index  ${_tabController.index}");
      //判断TabBar 是否在改变
      if(_tabController.indexIsChanging){
        //tabIndex = _tabController.index;
        onChangeTabAndPage(_tabController.index,p: _mPageController);
      }
    });
  }

  /*
   * 初始化 TabBar 得数据
   */
  _initTabList(){
    _tabList = [
      "碳酸饮料","水果","蔬菜","粮食","零食","小吃","烟火","生活用品","厨房用品"
    ];
  }
  //界面改变监听
  onChangeTabAndPage(int index,{PageController p,TabController tab}) async {
    if (p != null){
      print("onChangeTabAndPage index  $index");
      //等待pageview切换完毕,再释放pageivew监听
      isPageCanChange = false;
      await _mPageController.animateToPage(index, duration: new Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChange = true;
    }else{
      _tabController.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //print("  tabIndex  $tabIndex ");
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: _toolBarAPPBar(),
      body: new Column(
        children: <Widget>[
          //_searchClassify(),
          _editSearch(),
          //_tabBar(),

          new Container(
            height: 48.0,
            child: _tabBar(),
          ),
          //_scrollTabBar(),

          //_shopContentList(),
          //new Expanded(child: _classifyShopList(),)
          new Expanded(child: _scrollTabBar(),)

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
    return new Container(
      height: 48.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //搜索
          new Container(
            height: 48.0,
            //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 20.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Color(0xffF1F1F1),
            ),
            child: new TextField(
              cursorColor: Colors.grey,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff888888)
              ),
              decoration: InputDecoration(
                fillColor: Colors.green,
                prefixIcon: Icon(Icons.search,color: Color(0xff888888),),
                hintText: ValueString.searchHintText,
                hintStyle: TextStyle(
                  color: Color(0xff888888),
                  fontSize: 14.0,
                ),
                border: InputBorder.none,
              ),
            ),
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

  Widget _editSearch(){
    return //搜索
      new Container(
        height: 48.0,
        //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 20.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Color(0xffF1F1F1),
        ),
        child: new TextField(
          cursorColor: Colors.grey,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff888888)
          ),
          decoration: InputDecoration(
            fillColor: Colors.green,
            prefixIcon: Icon(Icons.search,color: Color(0xff888888),),
            hintText: ValueString.searchHintText,
            hintStyle: TextStyle(
              color: Color(0xff888888),
              fontSize: 14.0,
            ),
            border: InputBorder.none,
          ),
        ),
      );
  }

  /*
   * TabBar 控件
   */
  Widget _tabBar(){
    return new TabBar(tabs:_tabViewList(),controller: _tabController,
      //设置 TabBar 可以滚动
      isScrollable: true,
      indicatorColor: Color(0xffF6B13E),
      labelColor: Color(0xffF6B13E),
      unselectedLabelColor: Color(0xff222222),
    );
  }

  List<Widget> _tabViewList(){
    List<Widget> viewTab = List();

    for(int i=0;i<_tabList.length;i++){
      viewTab.add(new Tab(
          child: new Text(_tabList[i],
            style: const TextStyle(
                //color: Color(0xffF6B13E),
                fontSize: 16.0
            ),
          ),
        ),
      );
    }
    return viewTab;
  }

  /*
   * pageView 控件的使用
   */
  Widget _scrollTabBar(){
    return new PageView(
      children: <Widget>[
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
        _classifyShopList(),
      ],
      controller: _mPageController,
      onPageChanged: (index){
        print("PageView onPageChanged   ${index}");
        if (isPageCanChange){
          onChangeTabAndPage(index);
        }
      },
    );
  }

  /*
   * 商品分类列表
   */
  Widget _classifyShopList(){
    return new Container(
      color: Color(0xffF1F1F1),
      child: new ListView(
        children:_classifyList(),
      ),
    );
  }

  List<Widget> _classifyList(){
    List<Widget> _shopClassify = List();
    for(int i=0;i<10;i++){
      _shopClassify.add(new Container(
        child:  _shopContentList(),
        margin: EdgeInsets.all(10.0),
      ),);
    }
    return _shopClassify;
  }

  Widget _shopContentList(){
    return new Stack(
        children: <Widget>[

          new Container(
            color: Colors.white,
            height: 105.0,
            padding: EdgeInsets.only(left: 45.0,right: 5.0,),
            margin: EdgeInsets.only(left: 38.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //商品名称
                OftenView.oftenTopPadding(10.0),
                new Text("白日依山尽，黄河入海流。欲穷千里目，更上一层楼。",
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff222222),
                  ),
                ),

                //商品规格 和 商品单价
                new Row(
                  children: <Widget>[

                    new Expanded(child: new Column(
                      children: <Widget>[
                        new Text("规格：500g",
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff888888),
                          ),
                        ),

                        OftenView.oftenTopPadding(5.0),
                        new Text("￥122.00",
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff222222),
                          ),
                        ),

                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    ),

                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        //增加或者减少商品
                        new Row(
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
                              child: new Image.asset("images/icon_shop_minus.png",
                                width: 25.0,
                                height: 25.0,
                              ),
                              shape:  new CircleBorder(side: BorderSide.none,) ,
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
                              shape: new CircleBorder(side: BorderSide.none,),
                            ),
                          ],
                        ),

                        //商品总价格
                        new Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: new Text("￥122.00",
                            textAlign: TextAlign.left,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xff222222),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),

              ],
            ),
          ),
          //商品图片
          new Container(
            child: new Image.asset("images/icon_shop.jpg",
              width: 75.0,
              height: 75.0,
            ),
            height: 105.0,
          ),

      ],
    );
  }

}