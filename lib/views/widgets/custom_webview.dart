import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/core/constants/app_fonts.dart';
import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';// From webview_flutter package

class LocalHtmlViewer extends StatefulWidget {
  final String assetPath;

  const LocalHtmlViewer({super.key, required this.assetPath});

  @override
  State<LocalHtmlViewer> createState() => _LocalHtmlViewerState();
}

class _LocalHtmlViewerState extends State<LocalHtmlViewer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset(widget.assetPath); // Targets local bundle paths
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: 'View Content',fontSize: 26,fontFamily: AppFonts.robotoBold,fontColor: AppColors.primary,)),
      body: WebViewWidget(controller: _controller),
    );
  }
}