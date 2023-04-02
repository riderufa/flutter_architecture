import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// import 'services.dart';
// import 'api/internals.dart';
import 'service_provider.config.dart';

final getIt = GetIt.instance;

@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
void initializeServices() => getIt.init();

// @InjectableInit()
// void initializeServices() => $initGetIt(GetIt.I);

// class ServiceProvider {
//   static final _getIt = GetIt.I;

//   T get<T extends Object>() => _getIt.get<T>();

//   static final instance = ServiceProvider();

//   void initialize() {
//     _getIt.registerLazySingleton<HealthService>(
//       () => DummyService(),
//     );
//   }
// }