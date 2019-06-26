import 'package:flutter/material.dart';
import 'package:kid_flutter_test/constants/Constants.dart';
import 'package:kid_flutter_test/model/ChannelJson.dart';
import 'package:kid_flutter_test/util/NetUtils.dart';
import 'dart:convert';

class ChannelList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChannelListPageState();
}

class ChannelListPageState extends State<ChannelList> {
  final ScrollController _controller = ScrollController();
  final TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  final TextStyle subtitleStyle =
      TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);
  var listData;
  var slideData;
  var curPage = 1;

  var listTotalSize;

  @override
  void initState() {
    super.initState();
//    _controller.addListener(() {
//      var maxScroll = _controller.position.maxScrollExtent;
//      var pixels = _controller.position.pixels;
//      if (maxScroll == pixels && listData.length < listTotalSize) {
//        // scroll to bottom, get next page data
////        print("load more ... ");
//        curPage++;
//        getNewsList(true);
//      }
//    });
    getNewsList();
  }

  Future<Null> _pullToRefresh() async {
    curPage = 1;
    getNewsList();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // 无数据时，显示Loading
    if (listData == null) {
      return Center(
        // CircularProgressIndicator是一个圆形的Loading进度条
        child: CircularProgressIndicator(),
      );
    } else {
      // 有数据，显示ListView
      Widget divider1 = Divider(color: Colors.blue);
      Widget divider2 = Divider(color: Colors.green);
      Widget listView = ListView.separated(
        itemCount: listData.length,
        controller: _controller,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return Text(listData[index].title);
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      );
//      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
      return listView;
    }
  }

  void getNewsList() {
    String url = "https://kid168.com/channels.json";
    NetUtils.get(url).then((data) {
      if (data != null) {
        // 将接口返回的json字符串解析为map类型
        Map<String, dynamic> map = json.decode(data);
        if (map != null && map['channels'] != null) {
          // code=0表示请求成功
          listData = (map['channels'] as List)
              .map((e) => new ChannelJson.fromJson(e))
              .toList();
        }
      }
    });
  }
}
