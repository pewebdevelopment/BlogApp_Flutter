import 'package:blog_template/cubit/bookmark_button_cubit.dart';
import 'package:blog_template/cubit/related_posts_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_template/cubit/account_details_cubit.dart';
import 'package:blog_template/cubit/categories_cubit.dart';
import 'package:blog_template/cubit/change_password_cubit.dart';
import 'package:blog_template/cubit/comments_cubit.dart';
import 'package:blog_template/cubit/home_cubit.dart';
import 'package:blog_template/cubit/login_cubit.dart';
import 'package:blog_template/cubit/my_account_cubit.dart';
import 'package:blog_template/cubit/my_comments_cubit.dart';
import 'package:blog_template/cubit/post_detail_cubit.dart';
import 'package:blog_template/cubit/posts_cubit.dart';
import 'package:blog_template/cubit/reset_password_cubit.dart';
import 'package:blog_template/cubit/search_cubit.dart';
import 'package:blog_template/cubit/sign_up_cubit.dart';

class BlocProviders {
  BlocProviders._();

  static get getProviders => [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CategoriesCubit()),
        BlocProvider(create: (context) => PostsCubit()),
        BlocProvider(create: (context) => AccountDetailsCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => CommentsCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => MyAccountCubit()),
        BlocProvider(create: (context) => MyCommentsCubit()),
        BlocProvider(create: (context) => PostDetailCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => BookmarkButtonCubit()),
        BlocProvider(create: (context) => RelatedPostsCubit()),
      ];
}

