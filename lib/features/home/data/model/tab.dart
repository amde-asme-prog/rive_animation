import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TabItem {
  final UniqueKey id;
  final String artboard;
  final String stateMachine;
  SMIBool? status;

  TabItem({
    required this.artboard,
    required this.stateMachine,
  }) : id = UniqueKey();

  static List<TabItem> get tabItemsList => [
        TabItem(artboard: "HOME", stateMachine: "HOME_interactivity"),
        TabItem(artboard: "SEARCH", stateMachine: "SEARCH_interactivity"),
        TabItem(artboard: "CHAT", stateMachine: "CHAT_interactivity"),
        TabItem(artboard: "BELL", stateMachine: "BELL_interactivity"),
        TabItem(artboard: "USER", stateMachine: "USER_interactivity"),
      ];
}
