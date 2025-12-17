import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tabnewsnc_engine/tabnewsnc_engine.dart';

final class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    _newsRepo = Modular.get<NewsRepository>();
  }

  late final NewsRepository _newsRepo;

  bool _isLoading = false;
  List<NewsEntity> _news = [];

  bool get isLoading => _isLoading;
  List<NewsEntity> get news => _news;

  Future<void> loadAllNews() async {
    _isLoading = true;
    notifyListeners();

    _news = await _newsRepo.getAll(filter: .relevant);
    _isLoading = false;
    notifyListeners();
  }
}
