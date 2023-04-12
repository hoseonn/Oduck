import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oduck/features/profile/repo/darkmode_repo.dart';

import '../model/darkmode_model.dart';

class DarkModeViewModel extends Notifier<DarkModeModel> {
  final DarkModeRepository _repository;

  DarkModeViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDark(value);
    state = DarkModeModel(darkmode: value);
  }

  @override
  DarkModeModel build() {
    return DarkModeModel(
      darkmode: _repository.isDarkMode(),
    );
  }
}

final darkModeProvider = NotifierProvider<DarkModeViewModel, DarkModeModel>(
  () => throw UnimplementedError(),
);
