import 'package:blog_template/app_theme.dart';
import 'package:blog_template/cubit/search_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    final locals = Locals.of(context);
    final titleMedium = Theme.of(context).textTheme.titleMedium;
    final editKeyword = TextEditingController();

    cubit.getKeywords();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.search),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is InitialSearchState) {
            return const Loading();
          } else {
            state as LoadedSearchState;
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: editKeyword,
                    decoration: InputDecoration(
                      hintText: locals.enterSearchTerm,
                    ),
                    onSubmitted: (value) {
                      cubit.submit(context, value);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppTheme.secondaryTextColor(context),
                        );
                      },
                      itemCount: state.keywords.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.submit(
                                context, state.keywords[index].keyword);
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                state.keywords[index].keyword,
                                style: titleMedium,
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
