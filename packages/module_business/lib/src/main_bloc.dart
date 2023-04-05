import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:module_data/module_data.dart';

part 'main_bloc.freezed.dart';

@injectable
class MainBloc {
  final HealthService healthService;
  final UserService userService;
  final StreamController<int> _eventsController = StreamController();
  final StreamController<MainBlocEvent> _blocEventsController = StreamController();
  final StreamController<MainBlocState> _blocStateController = StreamController.broadcast();

  Stream<MainBlocState> get state => _blocStateController.stream;

  MainBloc({
    required this.healthService,
    required this.userService,
  }) {
    _blocEventsController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _blocStateController.add(const MainBlocState.loading());
          _blocStateController.add(MainBlocState.loaded(user: await userService.getDefaultUser()));
        },
        setUser: (event) async => _blocStateController.add(
          MainBlocState.loaded(user: await userService.getUserById(event.userId)),
        ),
      );
    });
  }

  void add(int event) {
    if (_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void addUser(MainBlocEvent event) {
    if (_blocEventsController.isClosed) return;
    _blocEventsController.add(event);
  }

  void dispose() {
    _eventsController.close();
    _blocEventsController.close();
    _blocStateController.close();
  }
}

@freezed
class MainBlocState with _$MainBlocState {
  const factory MainBlocState.loading() = MainLoadingState;
  const factory MainBlocState.loaded({required User user}) = MainLoadedState;
}

@freezed
class MainBlocEvent with _$MainBlocEvent {
  const factory MainBlocEvent.init() = _MainInitEvent;
  const factory MainBlocEvent.setUser({required int userId}) = _MainSetEvent;
}
