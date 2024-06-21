import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityGameScreen extends StatefulWidget {
  const UnityGameScreen({super.key});

  @override
  _UnityGameScreenState createState() => _UnityGameScreenState();
}

class _UnityGameScreenState extends State<UnityGameScreen> {
  late UnityWidgetController _unityWidgetController;

  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return UnityWidget(
      onUnityCreated: onUnityCreated,
    );
  }
}
