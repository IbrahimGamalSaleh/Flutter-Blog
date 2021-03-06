import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/articles/i_articles_facade.dart';
import '../../domain/entities/api_error/api_error.dart';
import '../../domain/entities/api_response/api_response.dart';
import '../../domain/entities/article/article.dart';
import '../../domain/entities/category/category.dart';

part 'bloc.freezed.dart';

part 'state.dart';

@injectable
class ArticlesBloc extends Cubit<ArticlesState> {
  final IArticlesFacade _articlesFacade;

  ArticlesBloc(this._articlesFacade) : super(ArticlesState.initial());

  void getCategories() async {
    emit(state.copyWith(categoriesState: none()));
    final result = await _articlesFacade.getCategories();
    emit(state.copyWith(categoriesState: optionOf(result)));
  }

  void getArticles() async {
    emit(state.copyWith(articlesState: none()));
    final result = await _articlesFacade.getArticles();
    emit(state.copyWith(articlesState: optionOf(result)));
  }

  void getArticlesByCategory(String categoryId) async {
    emit(state.copyWith(articlesState: none()));
    final result = await _articlesFacade.getArticlesByCategory(categoryId);
    emit(state.copyWith(articlesState: optionOf(result)));
  }
}
