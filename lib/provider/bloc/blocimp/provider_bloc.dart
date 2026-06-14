

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';

class ProviderBloc extends Bloc<ProviderProfileEvent, ProviderState> {
  ProviderBloc() : super(ProviderInitial());
}