import 'package:blog_template/locator.dart';
import 'package:blog_template/model/keyword.dart';
import 'package:blog_template/navigation/posts_page_parameters.dart';
import 'package:blog_template/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final Service service = getIt<Service>();

  SearchCubit() : super(const InitialSearchState());

  void getKeywords() async {
    final keywords = await service.getKeywords();
    emit(LoadedSearchState(keywords));
  }

  void submit(BuildContext context, String key) async {
    final keyword = await service.findKeyword(key);
    if (keyword != null) await service.deleteKeyword(keyword.id);

    await service.addKeyword(key).then(
      (value) {
        final params = PostsPageParameters(keyword: key);
        Navigator.of(context).pushReplacementNamed("/posts", arguments: params);
      },
    );
  }
}

@immutable
abstract class SearchState {
  const SearchState();
}

class InitialSearchState extends SearchState {
  const InitialSearchState() : super();
}

class LoadedSearchState extends SearchState {
  final List<Keyword> keywords;

  const LoadedSearchState(this.keywords) : super();
}
