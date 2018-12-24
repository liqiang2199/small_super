import 'package:flutter/material.dart';
import 'package:small_super/fragment/HomeFragment.dart';
import 'package:small_super/fragment/ClassifyFragment.dart';
import 'package:small_super/fragment/MeFragment.dart';
import 'package:small_super/fragment/ShoppingFragment.dart';
import 'package:small_super/value/string.dart';

import 'package:small_super/activity/OrderController.dart';
import 'package:small_super/activity/VendingMachineController.dart';

/*
 * if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
 */

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ValueString.homeTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: {
        "meOrder":(BuildContext context)=>new OrderController(),
        "vendingController":(BuildContext context)=>new VendingMachineController(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  var _titleBars = ['首页','分类','购物车','我的'];


  //返回图片
  Image _getImageAssets(String path){
    return new Image.asset(path,width: 20.0,height: 20.0,);
  }

  Image _getTabIcon(int curIndex){
    if(curIndex == _tabIndex){
      return _tabImages[curIndex][1];
    }else{
      return _tabImages[curIndex][0];
    }
  }

  //设置tab 字体颜色
  Text _getTabTitle(int curIndex){
    if(curIndex == _tabIndex){
      return new Text(_titleBars[curIndex],
        style: new TextStyle(color: Color(0xff222222)),);
    }else{
      return new Text(_titleBars[curIndex],
        style: new TextStyle(color: Color(0xff888888)),);
    }
  }

  var _bodys;
  var _tabImages;
  void initData(){
    //创建管理图片得二位数组
    _tabImages = [
      [
        _getImageAssets("images/icon_home_n.png"),
        _getImageAssets("images/icon_home.png"),
      ],
      [
        _getImageAssets("images/icon_classify_n.png"),
        _getImageAssets("images/icon_classify.png"),
      ],
      [
        _getImageAssets("images/icon_shopping_n.png"),
        _getImageAssets("images/icon_shopping.png"),
      ],
      [
        _getImageAssets("images/icon_me_n.png"),
        _getImageAssets("images/icon_me.png"),
      ]
    ];
    //保存页面数组
    _bodys = [

      new HomeFragment(),
      new ClassifyFragment(),
      new ShoppingFragment(),
      new MeFragment(),

    ];

  }

  @override
  Widget build(BuildContext context) {

    initData();

    return new Scaffold(
      body:_bodys[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: _getTabIcon(0) , title: _getTabTitle(0)),
        new BottomNavigationBarItem(icon: _getTabIcon(1) , title: _getTabTitle(1)),
        new BottomNavigationBarItem(icon: _getTabIcon(2) , title: _getTabTitle(2)),
        new BottomNavigationBarItem(icon: _getTabIcon(3) , title: _getTabTitle(3)),
      ],
        //样式
        type: BottomNavigationBarType.fixed,
        //当前索引
        currentIndex: _tabIndex,
        //创建点击监听
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
