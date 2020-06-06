import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterarchdemo/base/baseviewmodel.dart';
import 'package:flutterarchdemo/base/http/base_state.dart';
import 'package:flutterarchdemo/base/http/http.dart';
import 'package:flutterarchdemo/common/Urls.dart';
import 'package:flutterarchdemo/model/theaters_bean.dart';

class TheatersViewModel extends BaseViewModel {

  TheatersBean theatersBean;

  load(){
    state=BaseState.LOADING;
    notifyListeners();

    Http().get(Urls.theaters, {}, success: (json){
      compute(decode, json).then((value) {
        if(value==null){
          state = BaseState.EMPTY;
        }else{
          theatersBean = value;
          state = BaseState.CONTENT;
        }
        notifyListeners();
      });
      //refactor below to avoid longhaul when parsing, use thread to offload the work
      //theatersBean = TheatersBean.fromJson(json);

      print(theatersBean.title);
      //print(jsonEncode(json).toString());
    }, fail: (reason, statuscode){
      state = BaseState.FAIL;
      notifyListeners();
      //print(reason);
    }, after: (){});
  }

  static TheatersBean decode(dynamic json) {
    return TheatersBean.fromJson(json);
  }
}