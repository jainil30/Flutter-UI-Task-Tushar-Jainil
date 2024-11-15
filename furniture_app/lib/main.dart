import 'package:flutter/material.dart';
import 'package:furniture_app/models/user_model.dart';
import 'package:furniture_app/routes.dart';
import 'package:furniture_app/views/splash_screen.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'common/theme.dart';
import 'constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(StringConstants.USER_MODEL_HIVE);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.put(SignInController());
    //In will place it in widgets itself please ignore till the time
    // Get.put(SignUpController());
    // Get.put(ChangePasswordController());
    // Get.put(ProfilePageMenuItemController());
    // Get.put(NotificationMenuController());
    // Get.put(CheckoutController());

    return GetMaterialApp(
      title: 'Crafty',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => genterateRoutes(settings),
      home: const SplashScreen(),
    );
  }
}
