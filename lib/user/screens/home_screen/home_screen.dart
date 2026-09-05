import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
import 'package:mobile/components/input_box/hero_section.dart';
import 'package:mobile/components/service_offer/service_preview.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/user/bloc/blocimpl/category_bloc.dart';
import 'package:mobile/user/bloc/blocimpl/provider_list_bloc.dart';
import 'package:mobile/user/bloc/event/category_event.dart';
import 'package:mobile/user/bloc/event/provider_list_event.dart';
import 'package:mobile/user/bloc/state/category_state.dart';
import 'package:mobile/user/bloc/state/provider_list_state.dart';

import '../../../core/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  // StatefulWidget se StatelessWidget kar diya, kyunke local state ab yahan nahi
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (_) => getIt<CategoryBloc>()..add(FetchCategoriesEvent()),
        ),
        BlocProvider<ProviderListBloc>(
          create: (_) => getIt<ProviderListBloc>(),
        ),
      ],
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarWidget(),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 13.h),
                      TextFormField(
                        decoration: AppInputTheme.searchBar(
                          hint: 'Search services ',
                          icon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 12.w,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/search.svg",
                              width: 18.w,
                              height: 10.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                    ],
                  ),
                ),
                HeroSection(),
                SizedBox(height: 28.h),

                // service category
                BlocConsumer<CategoryBloc, CategoryState>(
                  listener: (context, state) {
                    if (state is CategoryLoaded &&
                        state.categories.isNotEmpty) {
                      context.read<ProviderListBloc>().add(
                        FetchProvidersHomeEvent(
                          categoryId: state.categories[0].id,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is CategoryLoaded) {
                      return CategorySection(categories: state.categories);
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(height: 28.h),

                // service Provider cards
                BlocBuilder<ProviderListBloc, ProviderListState>(
                  builder: (context, state) {
                    if (state is ProvidersListLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is ProvidersListError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is ProvidersListLoaded) {
                      return ServicePreview(providers: state.providers);
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
