import 'package:flutter/material.dart';
import 'package:furniture_app/common/bottom_nav.dart';
import 'package:furniture_app/models/interested_item_model.dart';
import 'package:furniture_app/views/all_brands_screen.dart';
import 'package:furniture_app/views/all_items_screen.dart';
import 'package:furniture_app/views/change_password_screen.dart';
import 'package:furniture_app/views/checkout_screen.dart';
import 'package:furniture_app/views/data_control_screen.dart';
import 'package:furniture_app/views/delivery_address_screen.dart';
import 'package:furniture_app/views/email_settings_screen.dart';
import 'package:furniture_app/views/eye_screen.dart';
import 'package:furniture_app/views/filter_screen.dart';
import 'package:furniture_app/views/home_screen.dart';
import 'package:furniture_app/views/initial_screen.dart';
import 'package:furniture_app/views/item_details_screen.dart';
import 'package:furniture_app/views/legal_policy_screen.dart';
import 'package:furniture_app/views/manage_address_screen.dart';
import 'package:furniture_app/views/notification_screen.dart';
import 'package:furniture_app/views/order_history_screen.dart';
import 'package:furniture_app/views/payments_screen.dart';
import 'package:furniture_app/views/profile_screen.dart';
import 'package:furniture_app/views/search_screen.dart';
import 'package:furniture_app/views/settings_screen.dart';
import 'package:furniture_app/views/sign_in_screen.dart';
import 'package:furniture_app/views/sign_up_screen.dart';
import 'package:furniture_app/views/support_center_screen.dart';
import 'package:furniture_app/views/track_order_screen.dart';

/*Created By: Tushar Jethva
  used_for: All application routes are defined here
*/
Route<dynamic> genterateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MyInitialScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyInitialScreen(), settings: routeSettings);

    case MyBottomNavigation.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyBottomNavigation(), settings: routeSettings);

    case MyHomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyHomeScreen(), settings: routeSettings);

    case MyItemDetailsScreen.routeName:
      ItemModel itemModel = routeSettings.arguments as ItemModel;
      return MaterialPageRoute(
          builder: (_) => MyItemDetailsScreen(
                item: itemModel,
              ),
          settings: routeSettings);

    //Jainil's Screen Route

    case SignInScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => SignInScreen(), settings: routeSettings);

    case SignUpScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => SignUpScreen(), settings: routeSettings);

    case ChangePasswordScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => ChangePasswordScreen(), settings: routeSettings);

    case MyProfileScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => MyProfileScreen(), settings: routeSettings);

    case EyeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => EyeScreen(), settings: routeSettings);

    case SettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => SettingsScreen(), settings: routeSettings);

    case TrackOrderScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => TrackOrderScreen(), settings: routeSettings);

    case CheckOutScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => CheckOutScreen(), settings: routeSettings);

    case PaymentScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => PaymentScreen(), settings: routeSettings);

    case OrderHistoryScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const OrderHistoryScreen(), settings: routeSettings);

    case DeliveryAddressScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const DeliveryAddressScreen(),
          settings: routeSettings);

    case SupportCenterScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const SupportCenterScreen(), settings: routeSettings);

    case LegalPolicyScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const LegalPolicyScreen(), settings: routeSettings);

    case EmailSettingsScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const EmailSettingsScreen(), settings: routeSettings);

    case ManageAddressScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const ManageAddressScreen(), settings: routeSettings);

    case DataControlScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const DataControlScreen(), settings: routeSettings);

    case MyHomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyHomeScreen(), settings: routeSettings);

    case CheckOutScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const CheckOutScreen(), settings: routeSettings);

    case NotificationScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => NotificationScreen(), settings: routeSettings);

    case MySearchScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MySearchScreen(), settings: routeSettings);

    case MyFilterScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyFilterScreen(), settings: routeSettings);

    case MyAllBrands.routeName:
      return MaterialPageRoute(
          builder: (_) => const MyAllBrands(), settings: routeSettings);

    case MyTotalItems.routeName:
      String appBarName = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => MyTotalItems(
                appBarName: appBarName,
              ),
          settings: routeSettings);

    case MyItemDetailsScreen.routeName:
      ItemModel itemModel = routeSettings.arguments as ItemModel;
      return MaterialPageRoute(
          builder: (_) => MyItemDetailsScreen(
                item: itemModel,
              ),
          settings: routeSettings);

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text("Page not found")),
        ),
      );
  }
}
