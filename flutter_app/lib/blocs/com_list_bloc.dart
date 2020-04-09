import 'dart:collection';

import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/data/repository/wan_repository.dart';

class ComListBloc implements BlocBase {
  BehaviorSubject<List<ReposModel>> _comListData =
      BehaviorSubject<List<ReposModel>>();

  Sink<List<ReposModel>> get _comListSink => _comListData.sink;

  Stream<List<ReposModel>> get comListStream => _comListData.stream;

  List<ReposModel> comList;
  int _comListPage = 0;



  WanRepository wanRepository = new WanRepository();

  @override
  Future getData({String labelId, int cid, int page}) {

  }

  @override
  Future onLoadMore({String labelId, int cid}) {
    int _page = 0;
    _page = ++_comListPage;
    return getData(labelId: labelId, cid: cid, page: _page);
  }

  @override
  Future onRefresh({String labelId, int cid}) {


    return getData(labelId: labelId, cid: cid, page: _comListPage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }





  }

  @override
  void dispose() {

  }


