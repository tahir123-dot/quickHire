import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/repositories/service_provider_repository.dart';

class ProviderBloc extends Bloc<ProviderProfileEvent, ProviderState> {
  final ServiceProviderRepository repository;

  ProviderBloc(this.repository) : super(ProviderInitial()) {
    on<ProviderBusinessDetailsEvent>(_onBusinessDetails);
    on<ProviderBannerImageEvent>(_onBannerImage);
    on<FetchSubCategoriesEvent>(_onFetchSubCategories);
    on<AddServiceEvent>(_onAddService);
    on<FetchProviderServicesEvent>(_onFetchServices);
    on<DeleteServiceEvent>(_onDeleteService);
    on<FetchTeamListEvent>(_onFetchTeamList);
    on<DeleteTeamMemberEvent>(_onDeleteTeamMember);
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
      final subCategories = await repository.getSubCategories(event.categoryId);
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
        serviceProviderId: '6a1e6abbb5759b02bac59cc1',
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
      final services = await repository.getProviderServices(
        event.serviceProviderId,
      );
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
      final services = await repository.getProviderServices(
        '6a1e6abbb5759b02bac59cc1',
      );
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
      final members = await repository.getTeamList(event.serviceProviderId);
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

      final members = await repository.getTeamList('6a1e6abbb5759b02bac59cc1');
      emit(TeamListLoaded(members: members));
    } catch (e) {
      emit(ProviderError(errorMessage: e.toString()));
    }
  }
}
