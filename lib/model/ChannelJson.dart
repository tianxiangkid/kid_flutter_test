// 用户信息
class ChannelJson {
  String title;
  String url;

  ChannelJson({this.title, this.url});

  ChannelJson.fromJson(e)
      : title = e['title'],
        url = e['url'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
      };
}
