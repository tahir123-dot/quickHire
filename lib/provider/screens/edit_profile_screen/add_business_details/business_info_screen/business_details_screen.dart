import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/utils/image.upload.dart';

class BusinessDetailsScreen extends StatefulWidget {
  const BusinessDetailsScreen({super.key});

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  File? profileImage;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> pickProfileImage() async {
    final image = await ImagePickerService.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70, // ✅ compress - upload fast hoga
      maxHeight: 500,
      maxWidth: 500,
    );
    if (image != null) setState(() => profileImage = image);
  }

  void _onSave(BuildContext context) {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();
    final phone = _phoneController.text.trim();

    // basic validation
    if (name.isEmpty || desc.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    context.read<ProviderBloc>().add(
      ProviderBusinessDetailsEvent(
        businessName: name,
        businessDescription: desc,
        businessPhone: phone,
        profileImage: profileImage, // null bhi ho sakta hai - optional hai
      ),
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
          // Navigator.pushNamed(context, '/next-screen'); // next screen pe jana ho to
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
          title: const Text('Business Info'),
        ),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 43.w),
            children: [
              SizedBox(height: 22.h),
              Text(
                'Business details',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 25.h),

              // ✅ Image Picker
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: pickProfileImage,
                  child: Container(
                    width: 131.w,
                    height: 131.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey.shade400),
                      image: profileImage != null
                          ? DecorationImage(
                              image: FileImage(profileImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: profileImage == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera_alt,
                                size: 22,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Upload",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withValues(alpha: 0.2),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.camera_alt,
                                      size: 22,
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
              ),
              SizedBox(height: 28.h),

              Text(
                'Business Info',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 17.h),
              const Text(
                'Choose the name displayed on your online booking profile',
              ),
              SizedBox(height: 42.h),

              // Business Name
              const Text(
                "Business name",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController, // ✅ controller
                decoration: AppInputTheme.withIcon(
                  hint: 'Vibrex',
                  icon: Icons.business,
                ),
              ),
              SizedBox(height: 19.h),

              // Description
              const Text("Description", style: TextStyle(color: Colors.black)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descController, // ✅ controller
                maxLines: 7,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: AppInputTheme.withIcon(
                  hint: 'About your business...',
                  icon: null,
                ),
              ),
              SizedBox(height: 19.h),

              // Phone
              const Text(
                "Business Phone",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _phoneController, // ✅ controller
                keyboardType: TextInputType.phone,
                decoration: AppInputTheme.withIcon(
                  hint: '+92 300 1234567',
                  icon: Icons.phone,
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
