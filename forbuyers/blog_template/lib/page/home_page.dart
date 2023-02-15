import 'package:blog_template/cubit/home_cubit.dart';
import 'package:blog_template/localization/locals.dart';
import 'package:blog_template/widget/categories_list.dart';
import 'package:blog_template/widget/featured_post_tile.dart';
import 'package:blog_template/widget/loading.dart';
import 'package:blog_template/widget/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final locals = Locals.of(context);
    cubit.getPosts();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.appName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/search")
                  .then((_) => cubit.getPosts());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is LoadingHomeState) {
            return const Loading();
          } else {
            state as LoadedHomeState;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 8.0),
                  const CategoriesList(),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FeaturedPostTile(
                            state.firstPost,
                            callback: () => Navigator.of(context)
                                .pushNamed("/postdetail",
                                    arguments: state.secondPost.id)
                                .then((_) => cubit.getPosts()),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FeaturedPostTile(
                                  state.secondPost,
                                  callback: () => Navigator.of(context)
                                      .pushNamed("/postdetail",
                                          arguments: state.secondPost.id)
                                      .then((_) => cubit.getPosts()),
                                ),
                              ),
                              Expanded(
                                child: FeaturedPostTile(
                                  state.thirdPost,
                                  callback: () => Navigator.of(context)
                                      .pushNamed("/postdetail",
                                          arguments: state.thirdPost.id)
                                      .then((_) => cubit.getPosts()),
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              final post = state.posts[index];
                              return PostTile(
                                post,
                                callback: () => Navigator.of(context)
                                    .pushNamed("/postdetail",
                                        arguments: post.id)
                                    .then((_) => cubit.getPosts()),
                              );
                            },
                          ),
                        ],
                      ),
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
