import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_thousand_and_one_designs/app/use_case.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';

import 'use_cases/fetch_designs_use_case.dart';

part 'home_page_cubit.g.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(FetchDesignsUseCase fetchDesignsUseCase)
      : super(HomePageState(fetchingDesigns: true, fetchingFailed: false)) {
    fetchDesignsUseCase.call().then((result) {
      if (result.success) {
        emit(state.copyWith(fetchingDesigns: false, designs: result.right));
      } else {
        emit(state.copyWith(
          fetchingFailed: true,
          fetchingDesigns: false,
        ));
      }
    });
  }

  Future<void> loadPage(int index) async {
    emit(state.copyWith(selectedDesignIndex: index));
  }

  loadPageFromUrl(int? page) {
    if (page == null) {
      page = 0;
    } else {
      page -= 1;
    }
    loadPage(page);
  }
}

@CopyWith()
class HomePageState {
  HomePageState({
    this.selectedDesignIndex = 0,
    this.designs = const [],
    this.fetchingDesigns = false,
    this.fetchingFailed = false,
  });

  final int selectedDesignIndex;
  final bool fetchingDesigns;
  final bool fetchingFailed;
  final List<DesignModel> designs;
}
