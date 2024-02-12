import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/pages/authentication/notify/authentication_provider.dart';
import 'package:flutter_app/routes/AppRouteBuilder.dart';
import 'package:flutter_app/themes/light_mode.dart';
import 'package:flutter_app/utils/SnackbarUtils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  AuthenticationProvider authenticationProvider = AuthenticationProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authenticationProvider),
      ],
      child: MyApp(
        authenticationProvider: authenticationProvider,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationProvider authenticationProvider;

  const MyApp({super.key, required this.authenticationProvider});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * Provide AuthenticationProvider to rebuild the routes based on user's state and roles
     */
    return ChangeNotifierProvider<AuthenticationProvider>.value(
      value: authenticationProvider,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: SnackbarUtils.messengerKey,
        title: 'Flutter Demo',
        theme: lightModeTheme,
        routerConfig: AppRouteBuilder.getRoutes(context),
      ),
    );
  }
}
