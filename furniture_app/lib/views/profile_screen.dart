import 'package:flutter/material.dart';
import 'package:furniture_app/common/colors.dart';
import 'package:furniture_app/common/sizes.dart';
import 'package:furniture_app/controllers/UserController.dart';
import 'package:furniture_app/views/sign_in_screen.dart';
import 'package:furniture_app/widgets/reusable_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/profile_menu.dart';

/*
  Created By : Jainil Dalwadi
  Purpose : Shows User Profile and menu
 */
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  static const String routeName = "/profileScreen";

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? email;
  String? name;
  // String? iconPath;
  bool? isOnline;

  final userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init not called");
    getSharedPreference();
  }

  void getSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userController.email.value = preferences.getString("email").toString();
    userController.name.value = preferences.getString("name").toString();
    userController.isOnline.value = preferences.getBool("isOnline")!;
    print("==========================");
    print(preferences.getString("email"));
    print(preferences.getString("name"));
    print(preferences.getBool("isOnline"));
  }

  @override
  Widget build(BuildContext context) {
    print("-------------------------------");
    print("Name :${name}");
    print("Email :$email");
    print("isOnline :$isOnline");

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, SignInScreen.routeName, (route) => false);
                },
                child: Text(
                  "Log out",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: redColor, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      foregroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
                      maxRadius: 50,
                    ),
                  ),
                  Positioned(
                    right: 145,
                    bottom: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      minRadius: 5,
                    ),
                  )
                ],
              ),
              const Gap(12),
              Obx(
                () => MyReusableText(
                    content: (userController.name.value.isEmpty)
                        ? userController.name.value.toString()
                        : "Jainil Dalwadi",
                    style: Theme.of(context).textTheme.displayMedium!),
              ),
              const Gap(5),
              MyReusableText(
                  content:
                      (email != null) ? email! : "jainil.dalwadi@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: greyColor)),
              Container(
                  margin: const EdgeInsets.only(top: 10, left: 24, right: 24),
                  // color: Colors.red,
                  height: getHeight(height: 0.6, context: context),
                  child: ProfileMenu()),
              const SizedBox(
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
