import 'package:flutter/material.dart';
import 'package:flutterapp/common/CommonKey.dart';
import 'package:flutterapp/data/repository/HotBean.dart';
import 'package:flutterapp/widgetTools/Toaster.dart';

class ArticleItem extends StatefulWidget {
  final dynamic itemData;

  ///是否为首页展示  如果是则可以点击进入知识体系
  final bool isHomeShow;

  ///是否可以点击作者,跳转作者的文章
  final bool isClickUser;

  //是否为我的收藏页  调用取消收藏的API不同
  final bool isMyFavoritePage;

  ArticleItem(
      this.itemData, {
        Key key,
        this.isHomeShow = true,
        this.isClickUser = true,
        this.isMyFavoritePage = false,
      }) : super(key: key);

  @override
  State createState() {
    return _ArticleItemState(itemData);
  }
}

class _ArticleItemState extends State<ArticleItem> {
  dynamic data;
  _ArticleItemState(itemData){
    this.data = itemData;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rightWidgetList = [];

    rightWidgetList.add(
      Text(
        data["title"],
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        //只展示一行
        maxLines: 1,
        //超出一行 显示...
        overflow: TextOverflow.ellipsis,
      ),
    );

    //构建中间的tag
//    var tagsList = _buildMiddleTags();
//    if (tagsList != null) {
//      rightWidgetList.add(tagsList);
//    }

    //底部的作者 时间 等信息
    rightWidgetList.add(_buildBottomInfo());

    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      //加了InkWell 点击有水波纹效果
      child: InkWell(
        child: Row(
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.deepOrange,
//                  onPressed: collectArticle,
                ),
              ),
            ),

            //右边   写成三行,标题+tag+底部那些信息   用好看的那个wanandroid的布局
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rightWidgetList,
              ),
            ),
          ],
        ),
        onTap: _onClickArticleItem,
      ),
    );
  }

  ///文章 item 点击事件
  void _onClickArticleItem() {
    Toaster.show("跳转");
//    RouteWebPageData pageData =
//    new RouteWebPageData(id: widget.itemData.id, title: widget.itemData.title, url: widget.itemData.link, collect: widget.itemData.collect);
//    Navigator.pushNamed(context, '/WebView');
    Navigator.of(context).pushNamed('/WebView', arguments: {'s':'ss'});
  }

  Widget _buildBottomInfo() {
    List<Widget> infoList = [];


    //图标
    infoList.add(Icon(
      Icons.folder_shared,
      color: Colors.orange,
      size: 20.0,
    ));

    //作者 或者  分享者
    infoList.add(
      GestureDetector(
        child: Padding(
          padding: EdgeInsets.only(
            /*top: 10.0, bottom: 10.0,*/
              left: 5.0,
              right: 6.0),
          child: Text(
            data["author"],
            //只展示一行
            maxLines: 1,
            //超出 展示...
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: widget.isClickUser ? Colors.blue : Colors.black54,
              fontSize: 10.0,
            ),
          ),
        ),
//        onTap: gotoAuthorListPage,
      ),
    );

    //时间
    infoList.add(Expanded(
      child: Text(
        '时间: ' + data["niceDate"],
        style: TextStyle(
          color: Colors.black54,
          fontSize: 10.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ));

    //chapter 分类
    infoList.add(
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: Text(
            data["superChapterName"] + " / " + data["chapterName"],
            maxLines: 1,
            style: TextStyle(
              color: widget.isHomeShow ? Colors.blue : Colors.black54,
              fontSize: 10.0,
              decoration: TextDecoration.none,
            ),
          ),
//          onTap: gotoKnowledgeArticleList,
        ),
      ),
    );

    return Row(
      children: infoList,
    );
  }
}