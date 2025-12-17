import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tabnews/ui/screens/home/home_view_model.dart';
import 'package:tabnews/ui/widgets/scrollbar_widget.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

final class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _viewModel = Modular.get<HomeViewModel>();
    unawaited(_viewModel.loadAllNews());
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ScrollbarWidget(
        controller: _controller,
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (_, _) => WheelListViewWidget(
            itemExtent: 90,
            controller: _controller,
            itemCount: _viewModel.news.length,
            loading: _viewModel.isLoading,
            itemBuilder: (_, index) => NewsCardWidget(
              height: 50,
              maxLines: 1,
              news: _viewModel.news[index],
            ),
          ),
        ),
      ),
    );
  }
}
