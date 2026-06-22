import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/provider/data/entity/sub_category_entity.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import '../../../../core/themes/app_button_theme.dart';
import '../../../../core/themes/app_input_theme.dart';
import '../../../../core/themes/colors.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  static const _categoryId = '69e393ea536653b9bd085a54';

  SubCategoryEntity? _selectedSubCategory;
  List<SubCategoryEntity> _subCategories = [];
  final _serviceNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProviderBloc>().add(
      FetchSubCategoriesEvent(categoryId: _categoryId),
    );
  }

  @override
  void dispose() {
    _serviceNameController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  void _onAdd(BuildContext context) {
    if (_selectedSubCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a service category')),
      );
      return;
    }
    if (_serviceNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter service name')),
      );
      return;
    }
    if (_priceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter price')));
      return;
    }
    if (_durationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter duration')));
      return;
    }

    context.read<ProviderBloc>().add(
      AddServiceEvent(
        categoryServiceId: _selectedSubCategory!.id,
        serviceName: _serviceNameController.text.trim(),
        servicePrice: double.parse(_priceController.text.trim()),
        serviceDuration: int.parse(_durationController.text.trim()),
      ),
    );
  }

  void _clearFields() {
    _serviceNameController.clear();
    _priceController.clear();
    _durationController.clear();
    setState(() => _selectedSubCategory = null);
  }

  void _retryFetch(BuildContext context) {
    context.read<ProviderBloc>().add(
      FetchSubCategoriesEvent(categoryId: _categoryId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderBloc, ProviderState>(
      listener: (context, state) {
        if (state is SubCategoriesLoaded) {
          setState(() => _subCategories = state.subCategories);
        }
        if (state is ProviderSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          _clearFields();
          context.read<ProviderBloc>().add(
            FetchSubCategoriesEvent(categoryId: _categoryId),
          );
        }
        if (state is ProviderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              action: SnackBarAction(
                label: 'Retry',
                textColor: Colors.white,
                onPressed: () => _retryFetch(context),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentBackground,
          title: const Text('Add Services'),
        ),
        body: SafeArea(
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              // ✅ Loading state - poori screen centered loader
              if (state is ProviderLoading && _subCategories.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.blackColor,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Loading categories...',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              // ✅ Error state - retry
              if (state is ProviderError && _subCategories.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 52,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Failed to load categories',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Please check your connection and try again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () => _retryFetch(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Try Again',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              // ✅ Categories loaded - poori form dikhao with animation
              return AnimatedOpacity(
                opacity: _subCategories.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 42.h),
                        Text('Add Services', style: AppTextTheme.h1),
                        SizedBox(height: 15.h),
                        const Text(
                          "Add a service to make it available for customers to book.",
                        ),
                        SizedBox(height: 26.h),

                        // ✅ Dropdown
                        DropdownButtonFormField<SubCategoryEntity>(
                          value: _selectedSubCategory,
                          isExpanded: true,
                          menuMaxHeight: 250.h,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey.shade500,
                          ),
                          decoration: AppInputTheme.withIcon(
                            hint: 'Service Category',
                            icon: Icons.category_outlined,
                          ),
                          hint: null,
                          items: _subCategories.map((subCat) {
                            return DropdownMenuItem<SubCategoryEntity>(
                              value: subCat,
                              child: Text(
                                subCat.categoryServiceName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (selected) {
                            setState(() => _selectedSubCategory = selected);
                          },
                        ),

                        SizedBox(height: 14.h),

                        TextFormField(
                          controller: _serviceNameController,
                          decoration: AppInputTheme.withIcon(
                            hint: 'Service Name',
                            icon: Icons.miscellaneous_services,
                          ),
                        ),

                        SizedBox(height: 14.h),

                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: AppInputTheme.withIcon(
                            hint: 'Rs 300.0',
                            icon: Icons.money,
                          ),
                        ),

                        SizedBox(height: 14.h),

                        TextFormField(
                          controller: _durationController,
                          keyboardType: TextInputType.number,
                          decoration: AppInputTheme.withIcon(
                            hint: '60 min',
                            icon: Icons.watch_later_outlined,
                          ),
                        ),

                        SizedBox(height: 205.h),

                        AppButtonTheme.iconTextButton(
                          text: 'View Services',
                          icon: Icons.view_agenda_outlined,
                          backgroundColor: AppColors.blackColor,
                          textColor: AppColors.whiteColor,
                          onPressed: () => context.push(
                            ProviderRoutesConstants.ViewServiceScreen,
                          ),
                        ),

                        SizedBox(height: 10.h),

                        // ✅ Add button - loading mein loader
                        state is ProviderLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AppButtonTheme.iconTextButton(
                                text: 'Add',
                                icon: Icons.add_task,
                                backgroundColor: AppColors.blackColor,
                                textColor: AppColors.whiteColor,
                                onPressed: () => _onAdd(context),
                              ),

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
