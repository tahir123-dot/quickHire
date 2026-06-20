import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/provider/data/entity/service_entity.dart';

class ViewServiceScreen extends StatefulWidget {
  const ViewServiceScreen({super.key});

  @override
  State<ViewServiceScreen> createState() => _ViewServiceScreenState();
}

class _ViewServiceScreenState extends State<ViewServiceScreen> {
  static const _serviceProviderId = '6a1e6abbb5759b02bac59cc1';

  @override
  void initState() {
    super.initState();
    context.read<ProviderBloc>().add(
      FetchProviderServicesEvent(serviceProviderId: _serviceProviderId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        title: const Text('Services'),
      ),
      body: SafeArea(
        child: BlocBuilder<ProviderBloc, ProviderState>(
          builder: (context, state) {
            // loading
            if (state is ProviderLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // loaded
            if (state is ServicesLoaded) {
              if (state.services.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.miscellaneous_services_outlined,
                        size: 64,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No services added yet',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                itemCount: state.services.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final service = state.services[index];
                  return _ServiceCard(
                    service: service,
                    onDelete: () {
                      context.read<ProviderBloc>().add(
                        DeleteServiceEvent(serviceId: service.id),
                      );
                    },
                  );
                },
              );
            }

            // error
            if (state is ProviderError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red.shade300,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red.shade400),
                    ),
                    SizedBox(height: 16.h),
                    TextButton(
                      onPressed: () {
                        context.read<ProviderBloc>().add(
                          FetchProviderServicesEvent(
                            serviceProviderId: _serviceProviderId,
                          ),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

// Service Card Widget
class _ServiceCard extends StatelessWidget {
  final ServiceEntity service;
  final VoidCallback onDelete;

  const _ServiceCard({required this.service, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Service icon
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.miscellaneous_services,
              color: AppColors.blackColor,
              size: 22,
            ),
          ),

          SizedBox(width: 12.w),

          // Service info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.serviceName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 13,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${service.serviceDuration} min',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(Icons.money, size: 13, color: Colors.grey.shade500),
                    SizedBox(width: 4.w),
                    Text(
                      'Rs ${service.servicePrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ✅ Delete icon
          GestureDetector(
            onTap: () => _confirmDelete(context),
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.delete_outline,
                color: Colors.red.shade400,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Delete confirm dialog
  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: const Text('Delete Service'),
        content: Text(
          'Are you sure you want to delete "${service.serviceName}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(); // ✅ delete callback
            },
            child: Text('Delete', style: TextStyle(color: Colors.red.shade400)),
          ),
        ],
      ),
    );
  }
}
