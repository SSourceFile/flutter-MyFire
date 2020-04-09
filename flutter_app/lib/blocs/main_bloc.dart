import 'dart:collection';

import 'package:azlistview/azlistview.dart';
import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/data/repository/collect_repository.dart';
import 'package:flutterapp/data/repository/wan_repository.dart';

class MainBloc implements BlocBase {
  ///****** ****** ****** Home ****** ****** ****** /

  BehaviorSubject<List<BannerModel>> _banner =
      BehaviorSubject<List<BannerModel>>();

  Sink<List<BannerModel>> get _bannerSink => _banner.sink;

  Stream<List<BannerModel>> get bannerStream => _banner.stream;

  BehaviorSubject<List<ReposModel>> _recRepos =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _recReposSink => _recRepos.sink;

  Stream<List<ReposModel>> get recReposStream => _recRepos.stream;

  BehaviorSubject<List<ReposModel>> _recWxArticle =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _recWxArticleSink => _recWxArticle.sink;

  Stream<List<ReposModel>> get recWxArticleStream => _recWxArticle.stream;

  ///****** ****** ****** Home ****** ****** ****** /

  ///****** ****** ****** Repos ****** ****** ****** /
  BehaviorSubject<List<ReposModel>> _repos =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _reposSink => _repos.sink;

  Stream<List<ReposModel>> get reposStream => _repos.stream;

  List<ReposModel> _reposList;
  int _reposPage = 0;

  ///****** ****** ****** Repos ****** ****** ****** /

  ///****** ****** ****** Events ****** ****** ****** /

  BehaviorSubject<List<ReposModel>> _events =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _eventsSink => _events.sink;

  Stream<List<ReposModel>> get eventsStream => _events.stream;

  List<ReposModel> _eventsList;
  int _eventsPage = 0;

  ///****** ****** ****** Events ****** ****** ****** /

  ///****** ****** ****** System ****** ****** ****** /

  BehaviorSubject<List<TreeModel>> _tree = BehaviorSubject<List<TreeModel>>();

  Sink<List<TreeModel>> get _treeSink => _tree.sink;

  Stream<List<TreeModel>> get treeStream => _tree.stream;

  List<TreeModel> _treeList;

  ///****** ****** ****** System ****** ****** ****** /

  ///****** ****** ****** Version ****** ****** ****** /


  @override
  void dispose() {
    _banner.close();
    _recRepos.close();
    _recWxArticle.close();
    _repos.close();
    _events.close();
    _tree.close();

  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }
}
