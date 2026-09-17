import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/shared/bloc/event/notification_event.dart';
import 'package:mobile/shared/bloc/state/notification_state.dart';
import 'package:mobile/shared/data/repositories/notification/notification_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;

  NotificationBloc(this.repository) : super(NotificationInitial()) {
    on<LoadNotificationsEvent>(_onLoadNotifications);
  }

  Future<void> _onLoadNotifications(
    LoadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    try {
      final notifications = await repository.getNotifications();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError('Notifications load error: $e'));
    }
  }
}
