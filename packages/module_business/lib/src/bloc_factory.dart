import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module_data/module_data.dart';
// import 'package:module_business/src/main_bloc.dart';
import 'bloc_factory.config.dart';

// class BlocFactory {
//   static final _getIt = GetIt.I;

//   T get<T extends Object>() => _getIt.get<T>();

//   static final instance = BlocFactory();

//   void initialize() {
//     ServiceProvider.instance.initialize();
//     _getIt.registerFactory<MainBloc>(
//       () => MainBloc(
//         healthService: ServiceProvider.instance.get<HealthService>(),
//       )
//     );
//   }
// }

GetIt getIt = GetIt.instance;

@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
void initializeBlocs() {
  initializeServices();
  getIt.init();
}
