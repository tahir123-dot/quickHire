import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/utils/image.upload.dart';

class BusinessBannerScreen extends StatefulWidget {
  const BusinessBannerScreen({super.key});

  @override
  State<BusinessBannerScreen> createState() => _BusinessBannerScreenState();
}

class _BusinessBannerScreenState extends State<BusinessBannerScreen> {
  File? bannerImage;

  Future<void> pickBannerImage() async {
    final image = await ImagePickerService.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70, // ✅ compress
      maxHeight: 1200,
      maxWidth: 500,
    );
    if (image != null) setState(() => bannerImage = image);
  }

  void _onSave(BuildContext context) {
    if (bannerImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a banner image')),
      );
      return;
    }

    context.read<ProviderBloc>().add(
      ProviderBannerImageEvent(bannerImage: bannerImage!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderBloc, ProviderState>(
      listener: (context, state) {
        if (state is ProviderSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          // Navigator.pushNamed(context, '/next'); // next screen
        }
        if (state is ProviderError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentBackground,
          title: const Text('Cover'),
        ),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            children: [
              SizedBox(height: 23.h),
              Text('Cover Image', style: AppTextTheme.h1),
              SizedBox(height: 17.h),
              const Text(
                'Select image which would be shown on your profile top',
              ),
              SizedBox(height: 50.h),

              GestureDetector(
                onTap: pickBannerImage,
                child: Container(
                  width: double.infinity, // ✅ full width - banner hota wide
                  height: 246.h,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarBackground,
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(5.r),
                    image: bannerImage != null
                        ? DecorationImage(
                            image: FileImage(bannerImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: bannerImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 32,
                              color: AppColors.lightgreyColor,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Upload your image here",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            // ✅ image pick hone ke baad change icon dikhao
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Colors.black.withValues(alpha: 0.2),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.camera_alt,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Change",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 20.h),
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              return state is ProviderLoading
                  ? const Center(child: CircularProgressIndicator())
                  : AppButtonTheme.iconTextButton(
                      text: 'Save',
                      icon: null,
                      backgroundColor: AppColors.blackColor,
                      textColor: AppColors.whiteColor,
                      onPressed: () => _onSave(context),
                    );
            },
          ),
        ),
      ),
    );
  }
}
