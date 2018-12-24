import 'package:flutter/material.dart';
import 'package:small_super/base/BaseController.dart';
import 'package:small_super/value/string.dart';
import 'package:small_super/widget/OfenView.dart';

class VendingMachineController extends BaseController{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VendingMachineController(toolBarAPPBar("售卖机列表", 1));
  }

}
class _VendingMachineController extends State<VendingMachineController> {

  Widget _vendingBar;

  _VendingMachineController(Widget vendingBar){
    this._vendingBar = vendingBar;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: _vendingBar,
      body: new Column(
        children: <Widget>[
          _editSearch(),
          OftenView.often10Padding(),
          new Expanded(child: new ListView(
            children: <Widget>[
              _machineList(),
              _machineList(),
              _machineList(),
            ],
          )),
        ],
      ),
    );
  }

  Widget _editSearch(){
    return //搜索
      new Container(
        height: 48.0,
        //padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0,bottom: 0.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Color(0xffF1F1F1),
        ),
        child: new TextField(
          cursorColor: Colors.grey,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
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

  Widget _machineList(){
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,),
      height: 71.0,
      child: new Column(
        children: <Widget>[

          new Row(
            children: <Widget>[
              new Image.asset("images/icon_sell_loction_n.png",
                width: 25.0,
                height: 25.0,
              ),

              OftenView.oftenLeftPadding(10.0),

              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("售卖机A",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff222222),
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  OftenView.oftenTopPadding(10.0),
                  new Text("绵阳市涪城区石桥铺跨境电子商务产业园114栋",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xff888888),
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),

                ],
              ),

            ],
          ),
          OftenView.oftenTopPadding(10.0),
          OftenView.line_One(),

        ],
      ),
    );
  }

//  Widget _machineList(){
//    return new Container(
//      color: Colors.white,
//      padding: EdgeInsets.all(10.0),
//      height: 75.0,
//      child:new Row(
//        children: <Widget>[
//          new Image.asset("images/icon_sell_loction_n.png",
//            width: 25.0,
//            height: 25.0,
//          ),
//
//          OftenView.oftenLeftPadding(10.0),
//
//          new Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new Text("售卖机A",
//                style: TextStyle(
//                  fontSize: 14.0,
//                  color: Color(0xff222222),
//                ),
//                textAlign: TextAlign.left,
//                overflow: TextOverflow.ellipsis,
//                maxLines: 1,
//              ),
//              OftenView.oftenTopPadding(10.0),
//              new Text("绵阳市涪城区石桥铺跨境电子商务产业园114栋",
//                style: TextStyle(
//                  fontSize: 12.0,
//                  color: Color(0xff888888),
//                ),
//                textAlign: TextAlign.left,
//                overflow: TextOverflow.ellipsis,
//                maxLines: 2,
//              ),
//
//            ],
//          ),
//
//        ],
//      ),
//    );
//  }

}