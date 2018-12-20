import 'package:flutter/material.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';

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
      appBar: _toolBarAPPBar(),
      body: new Column(
        children: <Widget>[
          new Expanded(child: new Container(
            child: new ListView(
              children: <Widget>[
                _shoppingList(),
                _shoppingList(),
                _shoppingList(),
              ],
            ),
          ),),
          OftenView.line_One(),
          _balance(),
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

  /*
   * 购物车列表
   */
  Widget _shoppingList(){
    return new Container(
      color: Color(0xffF1F1F1),
      child: new Column(
        children: <Widget>[
          _vendingMachineTitle(),

          //_vendingMachineShoppingList(),
          //不设置高度（405）就不显示
          new Container(
            height: 525.0,
            child: new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: _vendingMachineShoppingList(),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: _vendingMachineShoppingList(),
                ),

                new Container(
                  margin: EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: _vendingMachineShoppingList(),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
  //售卖机 标题
  Widget _vendingMachineTitle(){
    return new Container(
      height: 48.0,
      margin: EdgeInsets.only(left: 10.0,right: 10.0),
      child: new Row(
        children: <Widget>[
          new Image.asset("images/icon_sell_loction.png",
            width: 25.0,
            height: 25.0,
          ),
          OftenView.oftenLeftPadding(10.0),
          new Text("售卖机A",
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xff222222),
            ),
            textAlign: TextAlign.left,
          ),

        ],
      ),
    );
  }
  Widget _vendingMachineShoppingList(){
    return new Row(
      children: <Widget>[

        new Container(
          height: 135.0,
          child: new Image.asset("images/icon_shop.jpg",
            width: 75.0,
            height: 75.0,
          ),
        ),

        new Expanded(child: new Container(
          color: Colors.white,
          height: 135.0,
          margin: EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              // 商品标题  和 删除按钮
              new Container(child:
                new Row(
                  children: <Widget>[
                    //王孙归不归？
                    new Expanded(child: new Text("山中相送罢，日暮掩柴扉。春草明年绿，王孙归不归？",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff222222),
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),),

                    new Image.asset("images/icon_delete.png",
                      width: 25.0,
                      height: 25.0,
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),

              //商品规格
              new Text("规格：300g",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff888888),
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              //商品价格
              new Text("￥80.00",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xff222222),
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
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

            ],
          ),
        ),),

      ],
    );
  }

  /*
   * 结算
   */
  Widget _balance(){
    return new Container(
      padding: EdgeInsets.only(left: 10.0,right: 10.0,),
      height: 48.0,
      child: new Row(
        children: <Widget>[
          
          new Expanded(child: new Text('共计：￥188.00',
            style: TextStyle(
                fontSize: 16.0,
                color: Color(0xff222222),
            ),
          ),),

          new RaisedButton(
            color: Color(0xffF6B13E),
            onPressed: (){

            },
            child: new Text(
              "结算",
              style: TextStyle(fontSize: 14.0,
              color: Color(0xffffffff),),
            ),
          )
        ],
      ),
    );
  }

}