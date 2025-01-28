import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_thousand_and_one_designs/app/use_case.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';

import '../use_cases/fetch_designs_use_case.dart';

class SidePanelCubit extends Cubit<SidePanelState> {
  SidePanelCubit(this._designs, TextEditingController textEditing) : super(SidePanelState(searchResults: [])) {
    textEditing.addListener(() => doSearch(textEditing.text));
    doSearch('');
  }

  final List<DesignModel> _designs;

  void doSearch(String term) {
    term = term.trim().toLowerCase();
    if (term.isEmpty) {
      emit(SidePanelState(searchResults: _designs));
      return;
    }
    final List<DesignModel> results = [];
    final termWords = term.split(" ");
    for (var design in _designs) {
      final keys = design.words;
      word:
      for (var word in termWords) {
        for (var key in keys) {
          if (word.contains(key) || key.contains(word)) {
            results.add(design);
            break word;
          }
        }
      }
    }
    emit(SidePanelState(searchResults: results));
  }
}

class SidePanelState extends Equatable {
  const SidePanelState({
    this.searchResults = const [],
  });
  final List<DesignModel> searchResults;

  @override
  List<Object?> get props => [searchResults];
}
