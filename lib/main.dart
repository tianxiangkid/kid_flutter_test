import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kid_flutter_test/tv/ChannelList.dart';
import 'constants/Constants.dart';
import 'events/ChangeThemeEvent.dart';
import 'util/DataUtils.dart';
import 'util/ThemeUtils.dart';
import 'pages/NewsListPage.dart';
import 'pages/TweetsListPage.dart';
import 'pages/DiscoveryPage.dart';
import 'pages/MyInfoPage.dart';
import 'widgets/MyDrawer.dart';

void main() {
  runApp(PageTvList());
}

class PageTvList extends StatefulWidget {
  @override
  _PageTvListState createState() => _PageTvListState();
}

class _PageTvListState extends State<PageTvList> {
  var themeColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
          appBar: AppBar(
              title: Text("电视频道列表", style: TextStyle(color: Colors.white)),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white)),
          body: ChannelList(),
          bottomNavigationBar: null,
          drawer: null),
    );
  }
}
