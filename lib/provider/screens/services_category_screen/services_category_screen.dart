import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/components/category/service_category.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/user/bloc/blocimpl/category_bloc.dart';
import 'package:mobile/user/bloc/event/category_event.dart';
import 'package:mobile/user/bloc/state/category_state.dart';
import '../../../core/themes/app_text_theme.dart';
import '../../../routes/provider_routes/provider_routes_constants.dart';

class ServicesCategoryScreen extends StatelessWidget {
  const ServicesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: (_) => getIt<CategoryBloc>()..add(FetchCategoriesEvent()),
      child: const _ServicesCategoryScreenContent(),
    );
  }
}

class _ServicesCategoryScreenContent extends StatelessWidget {
  const _ServicesCategoryScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<ProviderBloc, ProviderState>(
          listener: (context, state) {
            if (state is ProviderSuccess) {
              context.go(ProviderRoutesConstants.provider);
            }
            if (state is ProviderError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 93.h),

                Text(
                  'Choose a category that represents your business',
                  style: AppTextTheme.h1,
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 35.h),

                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is CategoryLoaded) {
                      return Wrap(
                        spacing: 10.w,
                        runSpacing: 12.h,
                        children: state.categories.map((category) {
                          return ServiceCategory(
                            id: category.id.toString(),
                            title: category.categoryName,
                            imageUrl: category.categoryImage,
                            route: ProviderRoutesConstants.provider,
                          );
                        }).toList(),
                      );
                    }

                    return SizedBox();
                  },
                ),

                BlocBuilder<ProviderBloc, ProviderState>(
                  builder: (context, state) {
                    if (state is ProviderLoading) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
