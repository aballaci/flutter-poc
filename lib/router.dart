import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
class FluroRouter {
  static Router router = Router();
  static Handler _page1Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Page1());
  static Handler _page2Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Page2(username: params['username'][0]));
  static void setupRouter() {
    router.define(
      'page1',
      handler: _page1Handler,
    );
    router.define(
      'page2/:username',
      handler: _page2Handler,
    );
  }
}