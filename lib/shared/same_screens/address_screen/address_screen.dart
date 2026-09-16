import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/shared/bloc/blocimpl/location_bloc.dart';
import 'package:mobile/shared/bloc/event/location_event.dart';
import 'package:mobile/shared/bloc/state/location_state.dart';

import '../../../core/themes/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();

  LatLng? _currentCenter;
  bool _hasExistingLocation = false;

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LoadSavedLocationEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _zoomIn() {
    final zoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, zoom + 1);
  }

  void _zoomOut() {
    final zoom = _mapController.camera.zoom;
    _mapController.move(_mapController.camera.center, zoom - 1);
  }

  void _onSearchSubmitted(String value) {
    if (value.trim().isEmpty) return;
    FocusScope.of(context).unfocus();
    context.read<LocationBloc>().add(SearchLocationEvent(value.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Address'),
      ),
      body: SafeArea(
        child: BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state is LocationLoaded) {
              final isFirstLoad = _currentCenter == null;
              _currentCenter = state.selectedLocation;
              _hasExistingLocation = state.hasExistingLocation;

              if (state.recenterCamera && !isFirstLoad) {
                _mapController.move(state.selectedLocation, 16);
              }
            }

            if (state is LocationError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }

            if (state is LocationSaved) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _hasExistingLocation
                        ? 'Address update ho gaya'
                        : 'Address save ho gaya',
                  ),
                ),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            final isLoading = state is LocationLoading;
            final isSaving = state is LocationSaving;
            final address = state is LocationLoaded ? state.address : null;
            final hasLocation = _currentCenter != null;

            return ListView(
              children: [
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.w),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 480.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: !hasLocation
                              ? Container(
                                  color: AppColors.purpleLight.withValues(
                                    alpha: 0.1,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    FlutterMap(
                                      mapController: _mapController,
                                      options: MapOptions(
                                        initialCenter: _currentCenter!,
                                        initialZoom: 16,
                                        interactionOptions:
                                            const InteractionOptions(
                                              flags: InteractiveFlag.all,
                                            ),
                                        onMapEvent: (mapEvent) {
                                          if (mapEvent is MapEventMoveEnd) {
                                            context.read<LocationBloc>().add(
                                              MapMoveEndEvent(
                                                mapEvent.camera.center,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                          userAgentPackageName:
                                              'com.vibrex.quickhire',
                                        ),
                                      ],
                                    ),

                                    // search bar - map ke upar overlay
                                    Positioned(
                                      top: 10.h,
                                      left: 10.w,
                                      right: 10.w,
                                      child: Material(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        elevation: 3,
                                        child: TextField(
                                          controller: _searchController,
                                          textInputAction:
                                              TextInputAction.search,
                                          onSubmitted: _onSearchSubmitted,
                                          decoration: InputDecoration(
                                            hintText: 'Location search karo...',
                                            filled: true,
                                            fillColor: AppColors.whiteColor,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12.w,
                                                  vertical: 10.h,
                                                ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              borderSide: BorderSide.none,
                                            ),
                                            prefixIcon: IconButton(
                                              icon: const Icon(Icons.search),
                                              onPressed: () =>
                                                  _onSearchSubmitted(
                                                    _searchController.text,
                                                  ),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                size: 18,
                                              ),
                                              onPressed: () {
                                                _searchController.clear();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    // fixed pin - RED color
                                    Icon(
                                      Icons.location_pin,
                                      size: 45.sp,
                                      color: Colors.red,
                                    ),

                                    if (isLoading)
                                      Container(
                                        color: Colors.black.withValues(
                                          alpha: 0.15,
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),

                                    // zoom in / zoom out buttons
                                    Positioned(
                                      right: 10.w,
                                      bottom: 10.h,
                                      child: Column(
                                        children: [
                                          _ZoomButton(
                                            icon: Icons.add,
                                            onTap: _zoomIn,
                                          ),
                                          SizedBox(height: 8.h),
                                          _ZoomButton(
                                            icon: Icons.remove,
                                            onTap: _zoomOut,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // address preview box
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.purpleLight.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              size: 18.sp,
                              color: AppColors.blackColor,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                address ?? 'Address load ho raha hai...',
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      AppButtonTheme.iconTextButton(
                        text: 'Choose Current Location',
                        icon: Icons.location_on_outlined,
                        backgroundColor: AppColors.purpleLight,
                        textColor: AppColors.blackColor,
                        sideColor: AppColors.purpleLight,
                        onPressed: () => context.read<LocationBloc>().add(
                          LoadCurrentLocationEvent(),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      AppButtonTheme.iconTextButton(
                        text: isSaving
                            ? (_hasExistingLocation
                                  ? 'Updating...'
                                  : 'Saving...')
                            : (_hasExistingLocation
                                  ? 'Update Address'
                                  : 'Save Address'),
                        backgroundColor: AppColors.listBackground,
                        textColor: AppColors.whiteColor,
                        sideColor: AppColors.listBackground,
                        icon: null,
                        onPressed: isSaving
                            ? null
                            : () {
                                if (state is! LocationLoaded) {
                                  // ignore: avoid_print
                                  print(
                                    '⚠️ Abhi tak koi location select nahi hui',
                                  );
                                  return;
                                }
                                context.read<LocationBloc>().add(
                                  SaveLocationEvent(),
                                );
                              },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ZoomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ZoomButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Icon(icon, size: 20.sp, color: AppColors.blackColor),
        ),
      ),
    );
  }
}
