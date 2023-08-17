import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/articles/data/models/article.dart';

import '../../../../core/di.dart';
import '../../../../res/colors/app_colors.dart';
import '../../../../shared_widgets/main_text.dart';
import '../../../../shared_widgets/show_snack_bar.dart';
import '../../widgets/article_item.dart';
import '../cubits/cubit/articles_cubit.dart';
import '../cubits/cubit/articles_state.dart';
import 'article_details.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      lazy: false,
      create: (context) => Injector().articlesCubit..loadArticles(),
      child: BlocConsumer<ArticlesCubit, ArticlesState>(
        listener: (context, state) {
          if (state.isError) showSnackBar(context, message: state.errorMessage);
        },
        builder: (context, state) {
          if (state.isLoading)
            return const Center(child: CircularProgressIndicator());
          if (state.articles?.isNotEmpty != true) return errorWidget(context);
          return _buildBody(context);
        },
      ),
    );
  }

  Widget errorWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'No Articles Found\nPlease Try Again Later',
            style: TextStyle(
              color: AppColors.ACCENT_COLOR,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.read<ArticlesCubit>().loadArticles(),
          child: const Text('Retry'),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final state = context.read<ArticlesCubit>().state;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: state.articles?.length ?? 0,
              itemBuilder: (context, index) {
                final article = state.articles![index];
                return ArticleItem(
                  article: article,
                  onTap: () => _goToArticleDetails(context, article),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _goToArticleDetails(BuildContext context, Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetails(article),
      ),
    );
  }
}
