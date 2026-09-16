import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/category/filter_category/category_section.dart';
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

// NOTE: All bloc wiring (providers, events, states) is unchanged from the
// original file. Only the visual layer below has been redesigned:
//   - search bar restyled into a rounded pill
//   - HeroSection replaced with an inline purple promo banner
//   - CategorySection / ServicePreview are still your existing widgets and
//     still driven by the same CategoryBloc / ProviderListBloc state, since
//     restyling their internals needs their own source files. Send those
//     over if you want them redesigned to match this look too.

class HomeScreen extends StatelessWidget {
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
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(height: 13.h),
            const _SearchBar(),
            SizedBox(height: 20.h),
            BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryLoaded && state.categories.isNotEmpty) {
                  context.read<ProviderListBloc>().add(
                    FetchProvidersHomeEvent(categoryId: state.categories[0].id),
                  );
                }
              },
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CategoryError) {
                  return Center(child: Text(state.message));
                }
                if (state is CategoryLoaded) {
                  return CategorySection(categories: state.categories);
                }
                return const SizedBox();
              },
            ),
            SizedBox(height: 24.h),
            const _PromoBanner(),
            SizedBox(height: 24.h),

            BlocBuilder<ProviderListBloc, ProviderListState>(
              builder: (context, state) {
                if (state is ProvidersListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProvidersListError) {
                  return Center(child: Text(state.message));
                }
                if (state is ProvidersListLoaded) {
                  return ServicePreview(providers: state.providers);
                }
                return const SizedBox();
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

// ─── Search bar ───

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: AppInputTheme.searchBar(
        hint: 'Search services',
        icon: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            width: 18.w,
            height: 18.h,
          ),
        ),
      ),
    );
  }
}

// ─── Promo banner (replaces HeroSection) ───

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEDFE), // purple-50
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 220.w,
            child: Text(
              'Book trusted help, right at your door',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF26215C),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: 220.w,
            child: Text(
              'Plumbers, electricians and barbers, verified and ready',
              style: TextStyle(fontSize: 13.sp, color: const Color(0xFF534AB7)),
            ),
          ),
          SizedBox(height: 14.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF26215C),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Book now',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
