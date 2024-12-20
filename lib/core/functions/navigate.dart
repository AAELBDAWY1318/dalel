import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customPushNavigation(BuildContext context, String path, {dynamic data}) {
  GoRouter.of(context).push(path, extra: data);
}

void customPushReplacementNavigation(BuildContext context, String path,
    {dynamic data}) {
  GoRouter.of(context).pushReplacement(path, extra: data);
}

void customPop(BuildContext context) {
  GoRouter.of(context).pop();
}

void customPushAndRemoveAll(BuildContext context, String path) {
  GoRouter.of(context).go(path);
}
