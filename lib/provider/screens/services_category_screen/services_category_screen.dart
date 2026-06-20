import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/category/service_category.dart';
import 'package:mobile/user/bloc/blocimpl/category_bloc.dart';
import 'package:mobile/user/bloc/state/category_state.dart';
import '../../../core/themes/app_text_theme.dart';
import '../../../routes/provider_routes/provider_routes_constants.dart';

class ServicesCategoryScreen extends StatelessWidget {
  const ServicesCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        // 👈 list loop karo
                        return ServiceCategory(
                          title: category.categoryName, // 👈 real name
                          imageUrl: category.categoryImage, // 👈 real image
                          route: ProviderRoutesConstants.provider,
                        );
                      }).toList(),
                    );
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
