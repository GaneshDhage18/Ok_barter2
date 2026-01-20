
import 'package:okbarter2/core/extensions/app_imports.dart';
import 'package:okbarter2/features/auth/bloc/auth_bloc.dart';

void main() {
  runApp(const okbarter2());
}
class okbarter2 extends StatelessWidget {
  const okbarter2({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
        ),
      ),
    );;
  }
}