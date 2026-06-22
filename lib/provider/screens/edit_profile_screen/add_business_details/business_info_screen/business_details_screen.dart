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

  // ✅ ScrollController + FocusNodes for keyboard-aware scrolling
  final _scrollController = ScrollController();
  final _phoneFocusNode = FocusNode();
  final _descFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Jab phone field focus ho, scroll down karo taake visible rahe
    _phoneFocusNode.addListener(() {
      if (_phoneFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _phoneController.dispose();
    _scrollController.dispose();
    _phoneFocusNode.dispose();
    _descFocusNode.dispose();
    super.dispose();
  }

  Future<void> pickProfileImage() async {
    final image = await ImagePickerService.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    );
    if (image != null) setState(() => profileImage = image);
  }

  void _onSave(BuildContext context) {
    // Keyboard band karo pehle
    FocusScope.of(context).unfocus();

    final name = _nameController.text.trim();
    final desc = _descController.text.trim();
    final phone = _phoneController.text.trim();

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
        profileImage: profileImage,
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
        }
        if (state is ProviderError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        // ✅ KEY FIX: ye true rakho taake keyboard pe body resize ho
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentBackground,
          elevation: 0,
          title: const Text(
            'Business Info',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // ✅ Scrollable content - keyboard ke saath resize hoga
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  // ✅ bottom padding taake last field keyboard ke peeche na chhuppe
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    top: 16.h,
                    bottom: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business Details',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Choose the name displayed on your online booking profile',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // ✅ Image Picker - Row layout: image left, hint text right
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: pickProfileImage,
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                image: profileImage != null
                                    ? DecorationImage(
                                        image: FileImage(profileImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: profileImage == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          size: 24.sp,
                                          color: Colors.grey.shade500,
                                        ),
                                        SizedBox(height: 6.h),
                                        Text(
                                          "Upload",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black.withValues(
                                              alpha: 0.25,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.camera_alt,
                                                size: 22,
                                                color: Colors.white,
                                              ),
                                              SizedBox(height: 6.h),
                                              Text(
                                                "Change",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
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
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Business Logo',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Tap to upload a profile photo for your business',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 28.h),

                      // ─── Divider ───
                      Divider(color: Colors.grey.shade200, thickness: 1),
                      SizedBox(height: 20.h),

                      // ─── Business Name ───
                      _fieldLabel('Business Name'),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_descFocusNode),
                        decoration: AppInputTheme.withIcon(
                          hint: 'e.g. Vibrex Studio',
                          icon: Icons.business_outlined,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ─── Description ───
                      _fieldLabel('Description'),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: _descController,
                        focusNode: _descFocusNode,
                        maxLines: 5,
                        minLines: 4,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        onFieldSubmitted: (_) => FocusScope.of(
                          context,
                        ).requestFocus(_phoneFocusNode),
                        decoration: AppInputTheme.withIcon(
                          hint: 'Tell customers about your business...',
                          icon: null,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // ─── Business Phone ───
                      _fieldLabel('Business Phone'),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _onSave(context),
                        decoration: AppInputTheme.withIcon(
                          hint: '+92 300 1234567',
                          icon: Icons.phone_outlined,
                        ),
                      ),

                      // ✅ Extra bottom space taake phone field keyboard ke upar rahe
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),

              // Save button - Column ke andar fixed at bottom
              // Keyboard aaye toh bhi ye neeche rahega aur scroll ke saath nahi jayega
              BlocBuilder<ProviderBloc, ProviderState>(
                builder: (context, state) {
                  return Container(
                    color: AppColors.whiteColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    child: state is ProviderLoading
                        ? const Center(child: CircularProgressIndicator())
                        : AppButtonTheme.iconTextButton(
                            text: 'Save',
                            icon: null,
                            backgroundColor: AppColors.blackColor,
                            textColor: AppColors.whiteColor,
                            onPressed: () => _onSave(context),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Helper: consistent field labels
  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
    );
  }
}
