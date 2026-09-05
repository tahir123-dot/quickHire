import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';

class ProviderBloc extends Bloc<ProviderProfileEvent, ProviderState> {
  final ServiceProviderRepository repository;

  ProviderBloc(this.repository) : super(ProviderInitial()) {
    on<CreateProviderProfileEvent>(_onCreateProviderProfile);
    on<ProviderBusinessDetailsEvent>(_onBusinessDetails);
    on<ProviderBannerImageEvent>(_onBannerImage);
    on<FetchSubCategoriesEvent>(_onFetchSubCategories);
    on<AddServiceEvent>(_onAddService);
    on<FetchProviderServicesEvent>(_onFetchServices);
    on<DeleteServiceEvent>(_onDeleteService);
    on<FetchTeamListEvent>(_onFetchTeamList);
    on<DeleteTeamMemberEvent>(_onDeleteTeamMember);
    on<AddAvailabilityEvent>(_onAddAvailability);
    on<FetchAvailabilityEvent>(_onFetchAvailability);
  }

  // create provider profile
  Future<void> _onCreateProviderProfile(
    CreateProviderProfileEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final dto = InitServiceProviderDto(categoryId: event.categoryId);

      await repository.createProviderProfile(dto);
      emit(ProviderSuccess(message: 'Profile created successfully!'));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // create business details
  Future<void> _onBusinessDetails(
    ProviderBusinessDetailsEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final dto = UpdateBusinessDetailsDto(
        profileName: event.businessName,
        profileDescription: event.businessDescription,
        businessPhone: event.businessPhone,
        profileImage: event.profileImage,
      );

      await repository.createProviderBusinessDetails(dto);

      emit(ProviderSuccess(message: 'Business details saved!'));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // uplaod banner image
  Future<void> _onBannerImage(
    ProviderBannerImageEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final dto = UpdateBannerDto(profileBanner: event.bannerImage);
      await repository.createProviderBannerImage(dto);
      emit(ProviderSuccess(message: 'Banner uploaded successfully!'));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // get sub categories
  Future<void> _onFetchSubCategories(
    FetchSubCategoriesEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final subCategories = await repository.getSubCategories();
      emit(SubCategoriesLoaded(subCategories: subCategories));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // add services
  Future<void> _onAddService(
    AddServiceEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final dto = AddServiceDto(
        categoryServiceId: event.categoryServiceId,
        serviceName: event.serviceName,
        serviceDuration: event.serviceDuration,
        servicePrice: event.servicePrice,
      );

      await repository.addProviderService(dto);
      emit(ProviderSuccess(message: 'Service added successfully!'));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // get all services of this provider
  Future<void> _onFetchServices(
    FetchProviderServicesEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final services = await repository.getProviderServices();
      emit(ServicesLoaded(services: services));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // delete service
  Future<void> _onDeleteService(
    DeleteServiceEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      await repository.deleteProviderService(event.serviceId);

      // delete ke baad list reload karo
      final services = await repository.getProviderServices();
      emit(ServicesLoaded(services: services));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // fetch team list
  Future<void> _onFetchTeamList(
    FetchTeamListEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final members = await repository.getTeamList();
      emit(TeamListLoaded(members: members));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  // delete team member
  Future<void> _onDeleteTeamMember(
    DeleteTeamMemberEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      await repository.deleteTeamMember(event.teamMemberId);

      final members = await repository.getTeamList();
      emit(TeamListLoaded(members: members));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  Future<void> _onAddAvailability(
    AddAvailabilityEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      await repository.addAvailability(event.dto);
      emit(ProviderSuccess(message: 'Availability saved successfully!'));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchAvailability(
    FetchAvailabilityEvent event,
    Emitter<ProviderState> emit,
  ) async {
    emit(ProviderLoading());
    try {
      final availability = await repository.getAvailability();

      if (availability == null) {
        emit(AvailabilityNotSet());
      } else {
        emit(AvailabilityLoaded(availability: availability));
      }
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }
}
