import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:login_app/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../repository/user_repository/user_repository.dart';
import 'Image_picker.dart';
import 'package:path/path.dart' as p;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ProfileController();
    super.initState();
  }

  final profileController = Get.put(ProfileController());

  final _authRepo = Get.put(AuthenticationRepository());

  final _userRepo = Get.put(UserRepository());

  @override
  Widget build(BuildContext context) {
    Get.put(ImagePickerWidget());

    final userEmail = _authRepo.firebaseUser.value!.email as String;
    profileController.getUserNameData(userEmail);
    final pickerInstance = ImagePickerWidget.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          VAProfile,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(VADefaultSize),
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: pickerInstance.displayPickedImage()
                      // child: const Image(image: AssetImage(VAProfileImage)),
                      ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      pickerInstance.getImage();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: VAPrimaryColor),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Text(
                profileController.userName.value,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                userEmail,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(UpdateProfileScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: VAPrimaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      VAEditProfile,
                      style: TextStyle(color: VASeconsdaryColor),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              // Menu
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "Manage Tours",
                  icon: LineAwesomeIcons.suitcase,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Managemnt",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    AuthenticationRepository.instance.logout();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? VAPrimaryColor : VAAccentColor;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor,
        ),
        child: Icon(
          icon,
          // size: 18.0,
          color: isDark ? VAAccentColor : Colors.white,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18.0,
                color: Colors.grey,
              ))
          : null,
    );
  }
}
