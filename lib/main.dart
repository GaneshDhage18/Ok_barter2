import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/core/services/device_info_service.dart';
import 'package:okbarter2/core/services/local_db.dart';
import 'package:okbarter2/core/services/user.dart';
import 'package:okbarter2/features/auth/bloc/auth_bloc.dart';
import 'package:okbarter2/features/messages/bloc/messages_bloc.dart';

onAppStart() async {
  await LocalDb().init();
  CurrentUser().init();
  DeviceInfoService.getDeviceId();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await onAppStart();
  runApp(const OkBarter());
}

class OkBarter extends StatelessWidget {
  const OkBarter({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => MessagesBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
        ),
      ),
    );
    ;
  }
}
