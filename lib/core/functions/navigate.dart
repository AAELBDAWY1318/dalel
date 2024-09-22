import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customPushNavigation(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}

void customPushReplacementNavigation(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
